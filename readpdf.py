import pdfplumber

pdf_path = "./static/pdf/rishu2024.pdf"
output_txt_path = "./static/txt/test.txt"  # 保存するテキストファイルのパス

# 読み取りたいページ範囲を指定
start_page = 61
end_page = 62

# 抽出したい列のインデックス
target_columns = [1, 2, 3, 4]  # 専門科目用
#target_columns = [2, 3, 4, 5]  # 共通科目用

combined_data = []
with pdfplumber.open(pdf_path) as pdf:
    for page_num in range(start_page + 2, end_page + 3):
        page = pdf.pages[page_num]
        tables = page.extract_tables()
        
        for table in tables:
            if not table:  # 空のテーブルをスキップ
                continue
            
            # 指定した列インデックスのみを抽出し、単一リストに追加
            for row in table:
                filtered_row = [row[i].replace("\n", "") if row[i] is not None else "" for i in target_columns if i < len(row)]
                combined_data.append(filtered_row)

# テキストファイルに一行でリスト形式で保存
with open(output_txt_path, "w", encoding="utf-8") as f:
    f.write("[")  # リストの開始
    f.write(", ".join(
        "[" + ", ".join(f'"{cell}"' for cell in row) + "]\n"
        for row in combined_data
    ))
    f.write("]")  # リストの終了