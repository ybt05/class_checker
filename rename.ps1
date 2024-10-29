# ベースとなるダウンロード先のディレクトリ
$year = 2021
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..6 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 06

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
    "06" = @{ "zenki" = "ID1.pdf"; "kouki" = "ID2.pdf" }
}

# 2021年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2022
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..6 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 06

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
    "06" = @{ "zenki" = "ID1.pdf"; "kouki" = "ID2.pdf" }
}

# 2022年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2023
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..6 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 06

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
    "06" = @{ "zenki" = "ID1.pdf"; "kouki" = "ID2.pdf" }
}

# 2023年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2020
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2020年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2019
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2019年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2018
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2018年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2017
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2017年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2016
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2016年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2015
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2015年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}

# ベースとなるダウンロード先のディレクトリ
$year = 2014
$baseDownloadPath = "C:\Users\q5078\Desktop\class_checker\$year"
$terms = @("zenki", "kouki")
$numbers = 1..5 | ForEach-Object { "{0:D2}" -f $_ } # 01, 02, ..., 05

# リネームのマッピングを定義
$renameMap = @{
    "01" = @{ "zenki" = "common1.pdf"; "kouki" = "common2.pdf" }
    "02" = @{ "zenki" = "IC1.pdf"; "kouki" = "IC2.pdf" }
    "03" = @{ "zenki" = "IS1.pdf"; "kouki" = "IS2.pdf" }
    "04" = @{ "zenki" = "IM1.pdf"; "kouki" = "IM2.pdf" }
    "05" = @{ "zenki" = "IN1.pdf"; "kouki" = "IN2.pdf" }
}

# 2014年についてファイル名をリネーム
foreach ($number in $numbers) {
    foreach ($term in $terms) {
        $originalFileName = Join-Path -Path $baseDownloadPath -ChildPath "info-$year-$term-$number.pdf"
        if (Test-Path -Path $originalFileName) {
            $newFileName = $renameMap[$number][$term]
            $newFilePath = Join-Path -Path $baseDownloadPath -ChildPath $newFileName
            
            # ファイル名をリネーム
            Rename-Item -Path $originalFileName -NewName $newFilePath
            Write-Host "Renamed: $originalFileName to $newFilePath"
        } else {
            Write-Host "File not found: $originalFileName"
        }
    }
}