# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
    "06" = @{ "zenki" = "ID1.pdf"; "kouki" = "ID2.pdf" }
}

# ベースとなるダウンロード先のディレクトリ
$baseDownloadPath = "C:\Users\USERNAME\Desktop\class_checker"
$terms = @("zenki", "kouki")
$numbers = 1..6 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 06

# 2014年から2023年についてファイル名をリネーム
for ($year = 2014; $year -le 2023; $year++) {
    foreach ($number in $numbers) {
        foreach ($term in $terms) {
            $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "$year\info-$year-$term-$number.pdf"
            if (Test-Path -Path $originalFileName) {
                $newFileName = $renameMap[$number][$term] # 事前に$renameMapを定義しておく必要があります
                $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath "$year\$newFileName"
                
                # ファイル名をリネーム
                Rename-Item -Path $originalFileName -NewName $newFilePath
                Write-Host "Renamed: $originalFileName to $newFilePath"
            } else {
                Write-Host "File not found: $originalFileName"
            }
        }
    }
}
