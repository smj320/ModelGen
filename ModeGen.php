<?php
include_once(__DIR__ . "/vendor/autoload.php");

/**
 * SQLからEntityを読み込む
 * @param $model
 * @return array
 */
function read_entity($filename): array
{
    $fp = fopen(__DIR__ . "/sql/target/" . $filename, "r");
    $entities = [];
    while ($line = fgets($fp)) {
        if (preg_match("/#|^drop|^create|^\(|^\)|primary key/", $line)) continue;
        $line0 = trim($line);
        $cells = preg_split("/ +/", $line0);
        $var = $cells[0];
        $typeSQL = $cells[1];
        $comment = preg_replace("/[',]/", "", $cells[3]);
        //
        $type = "string";
        if (preg_match("/int/", $typeSQL)) $type = "int";
        if (preg_match("/float/", $typeSQL)) $type = "float";
        //
        $entities[] = ["var" => $var, "type" => $type, "comment" => $comment];
    }
    fclose($fp);
    return $entities;
}

/**
 * Entity Modelを出力する
 * @param $namespace
 * @param $modelName
 * @param $entities
 * @return void
 */
function out_entity($namespace, $modelName, $entities)
{
    //テンプレ
    $fmtG = <<< EOM
namespace %s\%s;

Class %s extends \\ArrayObject{
    %s
    function exchangeArray(\$array)
    {
    %s}
}
EOM;

    //ファイル準備
    $file = __DIR__ . "/Model/" . $modelName . ".php";
    $fp = fopen($file, "w");

    //Entity作成
    $ent = "";
    foreach ($entities as $entity) {
        $ent .= sprintf("public ?%s \$%s; //%s\n", $entity["type"], $entity["var"], $entity["comment"]);
    }

    //関数作成
    $func = "";
    foreach ($entities as $entity) {
        $func .= sprintf("\$this->%s = \$array['%s'] ?? null;\n", $entity["var"], $entity["var"]);
    }

    //出力
    fprintf($fp, "<?php\n");
    fprintf($fp, $fmtG, $namespace, $modelName, $modelName, $ent, $func);
    fclose($fp);
}

/**
 * Input Filter付きのFormを出力する
 * @param $namespace
 * @param $modelName
 * @param $entities
 * @return void
 */
function out_form($namespace, $modelName, $entities)
{
    //ガワのテンプレ
    $fmtG = <<< EOM
namespace %s\%s;

use Laminas\Form\Form;
use Laminas\Form\Element;
use Laminas\InputFilter\InputFilter;

Class %sForm extends Form
{
    function __construct(\$name = null)
    {
        parent::__construct();
        
        //Input Filter
        \$filter = new InputFilter();
        
        //Entity
        %s
    
        //送信ボタン
        \$this->add([
            'name' => 'submit',
            'type' => 'button',
            'attributes' => [
                'class' => 'btn btn-primary',
                'value' => 'Submit'
            ],
            'options' => [
                'label' => 'user.submit',
            ],
        ]);
        
        //CSRF
        \$this->add([
            'type' => Element\Csrf::class,
            'name' => 'csrf',
            'options' => [
            'csrf_options' => [
                'timeout' => 600, // optional
            ],
    ],
]);
        
        //Set Input filter
        \$this->setInputFilter(\$filter);
    }
}
EOM;

    //Form要素のテンプレ
    $fmtF = <<< EOM
        //%s
        \$this->add([
            'name' => '%s',
            'type' => 'text',
            'options' => [
                'label' => '%s'
            ],
            'attributes' => [
                'class' => 'form-control',
                'id' => 'id_%s',
            ]
        ]);
        \$filter->add([
           'name' => '%s',
            'required' => true,
             'validators' => [
                    [
                        "name" => "StringLength",
                        "options" => [
                         "min" => 1,
                        "max" => 50
                    ],
                ]
            ]
          ]
        );
        
EOM;

    //ファイル準備
    $file = __DIR__ . "/Form/" . $modelName . "Form.php";
    $fp = fopen($file, "w");

    //フォーム要素
    $ent = "";
    foreach ($entities as $entity) {
        $ent .= sprintf($fmtF, $entity["comment"], $entity["var"], $entity["comment"], $entity["var"], $entity["var"]);
    }

    //出力
    fprintf($fp, "<?php\n");
    fprintf($fp, $fmtG, $namespace, $modelName, $modelName, $ent);
    fclose($fp);
}

/**
 * Formを配置するviewのテンプレート
 * @param $namespace
 * @param $modelName
 * @param $entities
 * @return void
 */
function out_view($namespace, $modelName, $entities)
{
    $hd = <<< EOM
use Laminas\Form\Form;
/**
 * @var Form \$form
 */
?>
<div class="d-flex align-content-start flex-wrap">

EOM;

    $fmt = <<<EOM
        <div class="form-group w-20">
            <?= \$this->formRow(\$form->get('%s')) ?>
        </div>

EOM;
    //ファイル準備
    $file = __DIR__ . "/view/" . $modelName . ".phtml";
    $fp = fopen($file, "w");
    fprintf($fp,"<?php\n%s",$hd);
    foreach($entities as $ent){
        fprintf($fp,$fmt,$ent["var"]);
    }
    fprintf($fp,"</div>\n",$hd);
    fclose($fp);
}

function getModelName($filename): string
{
    $cells = preg_split("/[_.]/", $filename);
    return ucwords($cells[1]);
}

/**
 * エントリーポイント
 * @return void
 */
function main()
{
    $config = include("config.php");
    $files = glob(__DIR__ . "/sql/target/*.sql");

    foreach ($files as $fullPath) {
        $filename = basename($fullPath);
        $entities = read_entity($filename);
        $modelName = getModelName($filename);
        //out_entity($config["namespace"], $modelName, $entities);
        //out_form($config["namespace"], $modelName, $entities);
        out_view($config["namespace"], $modelName, $entities);
    }
}

main();


