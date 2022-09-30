# SQLのテーブル定義からLaminasのModelを出力する

Laminasのモデル、インプットフィルタつきのフォーム、 フォームのエレメントが並んだ
*.phtmlのテンプレートをテーブル定義SQLから生成します
（手で書いているとテーブルが多いと死にますよね）。SQL文はMySQLの文法です。
インプットフィルタの条件やらphtml上の配置とかは、出力後に調整してください。

## そもそものテーブル生成用SQLの作り方
ExcelのデータをDBに引っ張るとかが多いと思います。Excelの先頭行にカラム名が入っている
場合は、それを利用します。次の処理の都合上、SQLの予約語は小文字をで書きます。
ファイル名はxxx_mmmm.sql」としてください(xxx,mmmの文字数は任意,Mmmがモデル名になる)。

* データの先頭行をコピーして、データとは別のシートのA列に行列を入れ替えて保存する。
* B列にSQLで使える文字列に直したフィールド名を記入する。
* C列にvarchar(100)などののSQL型を記入していく。
* B,C,D列のデータと文字列連結関数とかを使って、E列に「field名 型 comment 'xxx',」の文字列を作る。
* create tableを定義する場所にE列の内容をコピペする。

このSQLで作ったテーブルは、ExcelをCSVにして読み込むときにも役立ちます。

## SQのLテーブル定義からLaminasのモデルを作る。
* sql/targetフォルダにテーブル定義を書いておく。sql/distに例がある。
* 定義で使用する文字は小文字、ただし変数名は大文字が入ってもよい。
* 記入する順番は変数名、型、コメントの順でnot nullとかprimary keyとかはその後に書く。
* namespaceをconfig.phpに書いておく。
* ModelGen.phpを実行すると、「
* EntityモデルがModelに、InputFilterつきのFormがFormに、Formを並べる例の+.phtmlがviewに生成される。

