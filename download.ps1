# ベースとなるダウンロード先のディレクトリ
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker"

# 年、zenki/kōki、01-06のリストを定義
$years = 2014..2023
$terms = @("zenki", "kouki")
$numbers = 1..6 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 06

# 各組み合わせに対してURLを生成し、ファイルをダウンロード
foreach ($year in $years) {
    # 年度ごとのディレクトリを作成
    $downloadPath = Join-Path -Path $baseDownloadPath -ChildPath $year
    if (-not (Test-Path -Path $downloadPath)) {
        New-Item -Path $downloadPath -ItemType Directory
    }

    foreach ($term in $terms) {
        foreach ($number in $numbers) {
            $url = "https://www.oit.ac.jp/inside/jugyou_anq/pdf/$year/$term/info-$number.pdf"
            $fileName = Join-Path -Path $downloadPath -ChildPath "info-$year-$term-$number.pdf"
            
            # ファイルをダウンロード
            try {
                Invoke-WebRequest -Uri $url -OutFile $fileName
                Write-Host "Downloaded: $fileName"
            } catch {
                Write-Host "Failed to download: $url"
            }
        }
    }
}