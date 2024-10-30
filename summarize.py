import ast
import os

# テキストファイルが保存されているディレクトリのパス
directory_path = "./static/txt"  # テキストを保存しているフォルダ
output_txt_path = "./static/summarize.txt"  # 保存するテキストファイルのパス

# ユニークなデータを格納するためのセット
unique_data = set()

# ディレクトリ内の各ファイルをループ
for filename in os.listdir(directory_path):
    if filename.endswith(".txt"):  # テキストファイルのみを対象
        file_path = os.path.join(directory_path, filename)
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read().strip()
            # リストを文字列として読み込み、リストに変換
            if content:
                try:
                    data_list = ast.literal_eval(content)  # リストに変換
                    for item in data_list:
                        # 各行をタプルに変換してセットに追加
                        unique_data.add(tuple(item))
                except (SyntaxError, ValueError):
                    print(f"Error parsing content from {filename}")

# ユニークなデータをリストに変換
unique_data_list = [list(item) for item in unique_data]

# テキストファイルにユニークなデータを保存
with open(output_txt_path, "w", encoding="utf-8") as f:
    f.write("[")  # リストの開始
    f.write(", ".join(
        "[" + ", ".join(f'"{str(cell)}"' for cell in row) + "]\n"
        for row in unique_data_list
    ))
    f.write("]")  # リストの終了
