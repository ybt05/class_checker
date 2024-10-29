from flask import Flask, render_template
import threading, webbrowser

ServiceName = "ClassChecker"
app = Flask(__name__, static_url_path="/static")

data = [
    {"id": 1, "name": "Alice", "age": 30},
    {"id": 2, "name": "Bob", "age": 24},
    {"id": 3, "name": "Charlie", "age": 29},
]

# ホーム画面
@app.route("/")
def index():
    return render_template("index.html", ServiceName=ServiceName,data=data)

# サポート
@app.route("/support")
def support():
    return render_template("support.html", ServiceName=ServiceName)

if __name__ == "__main__":
    #threading.Timer(1.0, lambda: webbrowser.open('http://localhost:5000') ).start()
    #app.run(debug=False)
    app.run(debug=True)
