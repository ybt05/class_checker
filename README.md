#OIT Class Checker

## ダウンロード方法

c1-byod上で以下のコマンドを実行するとダウンロードできる．フォルダは好きなところで良いが，ここでは「```~/```」に展開するとする．

``` sh
cd ~/
git clone https://github.com/ybt05/class_checker.git
chmod -R 755 class_checker
cd class_checker/
sh setup.sh
```

以下にclass_checkerフォルダのフォルダ構造を記載しておきます．

``` file
  📁class_checker       // 作成したMinecraft_Contestフォルダ
   ┗ 📁static               // Botを動かすために必要なpythonファイル関係
   ┗ 📁templates               // yoloをコンテナで動かす環境（試作）
     📃 app.py              // ウェブアプリケーションを起動するファイル
     📃 readpdf.py           // control.cファイルのヘッダファイル
     📃 summarize.py           // botプログラムのサンプル．このプログラムを参考にbotプログラムを書く
     📃 requirements.txt    // setup.sh実行時に必要
     📃 setup.sh            // 初回セットアップ時に実行するshellプログラム
```
