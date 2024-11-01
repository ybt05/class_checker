# 年、zenki/kouki、01-06のリストを定義
years=$(seq 2014 2023)
terms=("zenki" "kouki")
numbers=$(seq -w 01 06) # 01, 02, ..., 06

# 各組み合わせに対してURLを生成し、ファイルをダウンロード
for year in $years; do
    # 年度ごとのディレクトリを作成
    downloadPath="./static/pdf/$year"
    mkdir -p "$downloadPath"

    for term in "${terms[@]}"; do
        for number in $numbers; do
            url="https://www.oit.ac.jp/inside/jugyou_anq/pdf/$year/$term/info-$number.pdf"
            fileName="$downloadPath/info-$year-$term-$number.pdf"

            # ファイルをダウンロード
            if wget -q -O "$fileName" "$url"; then
                echo "Downloaded: $fileName"
            else
                echo "Failed to download: $url"
            fi
        done
    done
done

# リネームのマッピングを定義
declare -A renameMap=(
    ["01,zenki"]="common1.pdf" ["01,kouki"]="common2.pdf"
    ["02,zenki"]="IC1.pdf" ["02,kouki"]="IC2.pdf"
    ["03,zenki"]="IS1.pdf" ["03,kouki"]="IS2.pdf"
    ["04,zenki"]="IM1.pdf" ["04,kouki"]="IM2.pdf"
    ["05,zenki"]="IN1.pdf" ["05,kouki"]="IN2.pdf"
    ["06,zenki"]="ID1.pdf" ["06,kouki"]="ID2.pdf"
)

# 2014年からファイル名をリネーム
for year in $years; do
    for number in $numbers; do
        for term in "${terms[@]}"; do
            originalFileName="./static/pdf/$year/info-$year-$term-$number.pdf"
            if [[ -f "$originalFileName" ]]; then
                newFileName="${renameMap["$number,$term"]}"
                newFilePath="./static/pdf/$year/$newFileName"

                # ファイル名をリネーム
                mv "$originalFileName" "$newFilePath"
                echo "Renamed: $originalFileName to $newFilePath"
            else
                echo "File not found: $originalFileName"
            fi
        done
    done
done

curl -o python.zip https://www.python.org/ftp/python/3.12.3/python-3.12.3-embed-amd64.zip
unzip python.zip -d python
rm -f python.zip
chmod -R 755 python

cd python
echo "import site" >> python312._pth

curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
echo "import sys; sys.path.append('')" >> setting.pth

./python.exe get-pip.py
./python.exe -m pip install update

./python.exe -m pip install -r ../requirements.txt

git config --local core.filemode false