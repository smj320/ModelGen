#　SQLのテーブル定義からLaminasのModelを出力する

## SQLテーブルの作り方
* Excel上で、列名をA列に縦変換する。
* B列にSQLで使える文字列に直したフィールド名を記入する。
* C列にvarchar(100)などののSQL型を記入していく。
* D列に&を使うなどして、「fileld 型 comment 'xxx',」を作ってcreate tableを定義する場所にコピペする。
* 次の処理の都合上、SQLの予約語は小文字でかいておく。

## SQLテーブル定義からLaminasのモデルを作る。
* sql/targetフォルダにテーブル定義を書いておく。sql/distに例がある。
* 使用する文字は小文字、ただし変数名は大文字が入ってもよい。
* 記入する順番は変数名、型、コメントの順でnot nullとかprimary keyとかはその後に書く。
* namespaceをconfig.phpに書いておく。
* ModelGen.phpを実行すると、「xxx_モデル名.sql」になる。
* EntityモデルがModelに、InputFilterつきのFormがFormに、Formを並べる例の+.phtmlがviewに生成される。

