# OIT Class Checker

## ダウンロード方法

c1-byod上で以下のコマンドを実行するとダウンロードできる.(download.shの実行には学内WiFiが必要)

``` sh
cd
git clone https://github.com/ybt05/class_checker.git
chmod -R 755 class_checker
cd class_checker/
sh setup.sh
sh download.sh
```

以下にclass_checkerフォルダのフォルダ構造を記載しておく．

``` file
  📁class_checker           // 作成したclass_checkerフォルダ
   ┗ 📁static               // 
      ┣ 📁css               // cssファイルを入れるフォルダ
      ┗ 📁pdf               // pdfファイルを入れるフォルダ
         ┣ 📁2014           // 2014年度の授業科目に係る情報(学生による授業アンケート結果・成績評価状況等)が書かれたファイルが入ったフォルダ
         ┃     ～            
         ┣ 📁2024           // 2024年度の授業科目に係る情報(学生による授業アンケート結果・成績評価状況等)が書かれたファイルが入ったフォルダ
         ┗ 📃 rishu_I.pdf   // 履修申請要領(必要なら各自ダウンロードしてください)
      ┣ 📁txt               // txtファイルを入れるフォルダ
      ┗ 📃 summarize.txt    // txtフォルダ内のtxtファイルの情報をまとめたもの
   ┣ 📁templates            // htmlファイルを入れるフォルダ
   ┣ 📁python               // プログラムを動かすのに必要なpythonファイル
   ┣ 📃 app.py              // ウェブアプリケーションを起動するプログラム
   ┣ 📃 readpdf.py          // rishu_I.pdfから必要な情報を抜き出しtxtフォルダ内のtxtファイルに保存するプログラム
   ┣ 📃 summarize.py        // txtフォルダ内のtxtファイルの情報をsummarize.txtにまとめるためのプログラム
   ┣ 📃 requirements.txt    // setup.sh実行時に必要
   ┣ 📃 setup.sh            // 初回セットアップ時に実行するshellプログラム(pythonのダウンロード)
   ┣ 📃 download.sh         // 必要なpdfファイルをダウンロードする(学内WiFi必須)
   ┗ 📃 README.md           // 説明書
```

## 実行方法

python/python.exe app.py

## 2024年度以降の情報に対応させる方法

download.shの"years=$(seq 2014 2024)"の2024の部分を書き換える.  
必要に応じてリネームのマッピングの部分も書き換える.  (IR非対応のため)
sh download.shを実行する.  
app.pyの"YEAR = 2024"の2024の部分を書き換える.  

### rishu_I.pdfファイルの情報を新たに読み込む場合  
readpdf.pyの'output_txt_path = "./static/txt/test.txt"'のtest.txtの部分と読み取りたいページ範囲と抽出したい列のインデックスを書き換えて実行する.(python/python.exe readpdf.py)  
抽出したい列のインデックスは不必要なほうのみをコメントアウトさせる.  
summarize.pyを実行する.(python/python.exe summarize.py)  



