from flask import Flask, render_template, request
import pdfplumber
import ast
import threading, webbrowser

ServiceName = "OIT ClassChecker"
app = Flask(__name__, static_url_path="/static")
YEAR = 2024

columns = ['年度', '学科', '期間', '授業科目名', '授業担当者', '履修者数', '学年', '単位数', '必修',' 合格率',
            'G(合格)', 'A', 'B', 'C', 'D', 'F', '*(評価不能)', 'GPA', 'GP中央値',
            '回答者数', '設問1', '設問2', '設問3', '設問4', '設問5', '設問6', '設問7', '設問8', '設問9','講義コード' ]
data = []
txt_data = []

def readtxt():
    global txt_data
    input_txt_path = "./static/summarize.txt"
    with open(input_txt_path, "r", encoding="utf-8") as f:
        content = f.read().strip()
        if content:
            try:
                # 文字列をリストとして評価
                txt_data = ast.literal_eval(content)  # 文字列をリストに変換
            except (SyntaxError, ValueError):
                print("Error parsing the content from the file.")

def setdata1(year,dep,t):
    global txt_data
    if t==1:
        term ="前期"
    if t==2:
        term ="後期"
    pdf_path = f'static/pdf/{year}/{dep}{t}.pdf'
    # 抽出したデータを保存するリスト
    all_tables_data = []
    # PDFを開いて全ページから表を抽出
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:  # 各ページをループ
            tables = page.extract_tables()  # ページから表を抽出
            for table in tables:
                # 各表をリストに変換
                all_tables_data.append(table)  # リストに追加
    if dep=="common":
        dep="共通科目"
    # リストの各要素を処理
    for table in all_tables_data:
        for tmp in table:
            if tmp[0]=='№'or tmp[0]==None or int(tmp[4])<10:
                continue
            i=0
            grade="None"
            credit_str=""
            required="None"
            credit=0
            tmp2=tmp[i+1]
            for k in txt_data:
                if k[1] == tmp2[0:6] or k[0] == tmp[i+2]:
                    grade=k[3]
                    credit_str=k[2]
            if credit_str and credit_str[0]=="●":
                required="必修"
                credit=int(credit_str[1])
            elif credit_str and credit_str[0]=="■":
                required="選必"
                credit=int(credit_str[1])
            elif credit_str:
                required="選択"
                credit=int(credit_str)

            data.append({"year":year,"department":dep,"term":term,"code":tmp[i+1],"subject":tmp[i+2],
                        "teacher":tmp[i+3],"student_num":int(tmp[i+4]),"respondent_num":tmp[i+5],
                        "question1":tmp[i+6],"question2":tmp[i+7],"question3":tmp[i+8],"question4":tmp[i+9],
                        "question5":tmp[i+10],"question6":tmp[i+11],"question7":tmp[i+12],"question8":tmp[i+13],
                        "question9":tmp[i+14],"G":tmp[i+15],"A":tmp[i+16],"B":tmp[i+17],"C":tmp[i+18],"D":tmp[i+19],"F":tmp[i+20],"X":tmp[i+21],
                        "passrate":tmp[i+22],"GPA":tmp[i+23],"GPM":tmp[i+24],"grade":grade,"required":required,"credit":credit})

def setdata2(year,dep,t):
    global txt_data
    if t==1:
        term ="前期"
    if t==2:
        term ="後期"
    pdf_path = f'static/pdf/{year}/{dep}{t}.pdf'
    # 抽出したデータを保存するリスト
    all_tables_data = []
    # PDFを開いて全ページから表を抽出
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:  # 各ページをループ
            tables = page.extract_tables()  # ページから表を抽出
            for table in tables:
                # 各表をリストに変換
                all_tables_data.append(table)  # リストに追加
    
    # リストの各要素を処理
    for table in all_tables_data:
        for tmp in table:
            if tmp[0]=='№'or tmp[0]==None:
                continue
            i=0
            grade="None"
            credit_str=""
            required="None"
            credit=0
            tmp2=tmp[i+1]
            for k in txt_data:
                if k[1] == tmp2[0:6] or k[0] == tmp[i+2]:
                    grade=k[3]
                    credit_str=k[2]
            if credit_str and credit_str[0]=="●":
                required="必修"
                credit=int(credit_str[1])
            elif credit_str and credit_str[0]=="■":
                required="選必"
                credit=int(credit_str[1])
            elif credit_str:
                required="選択"
                credit=int(credit_str)
            data.append({"year":year,"department":dep,"term":term,"code":tmp[i+1],"subject":tmp[i+2],
                        "teacher":tmp[i+3],"student_num":int(tmp[i+4]),"respondent_num":tmp[i+5],
                        "question1":tmp[i+6],"question2":tmp[i+7],"question3":tmp[i+8],"question4":tmp[i+9],
                        "question5":tmp[i+10],"question6":tmp[i+11],"question7":tmp[i+12],"question8":tmp[i+13],
                        "question9":tmp[i+14],"G":tmp[i+15],"A":tmp[i+16],"B":tmp[i+17],"C":tmp[i+18],"D":tmp[i+19],"F":tmp[i+20],"X":tmp[i+21],
                        "passrate":tmp[i+22],"GPA":None,"GPM":None,"grade":grade,"required":required,"credit":credit})

def getData(option):
    if option=="IN1":
        for j in range(2021,YEAR+1):
            setdata1(j,"IN",1)
        for j in range(2020,YEAR+1):
            setdata1(j,"IN",2)
    if option=="IN2":
        for j in range(2014,2020):
            setdata2(j,"IN",1)
        for j in range(2014,2020):
            setdata2(j,"IN",2)
    if option=="IC1":
        for j in range(2021,YEAR+1):
            setdata1(j,"IC",1)
        for j in range(2020,YEAR+1):
            setdata1(j,"IC",2)
    if option=="IC2":
        for j in range(2014,2020):
            setdata2(j,"IC",1)
        for j in range(2014,2020):
            setdata2(j,"IC",2)
    if option=="IS1":
        for j in range(2021,YEAR+1):
            setdata1(j,"IS",1)
        for j in range(2020,YEAR+1):
            setdata1(j,"IS",2)
    if option=="IS2":
        for j in range(2014,2020):
            setdata2(j,"IS",1)
        for j in range(2014,2020):
            setdata2(j,"IS",2)
    if option=="IM1":
        for j in range(2021,YEAR+1):
            setdata1(j,"IM",1)
        for j in range(2020,YEAR+1):
            setdata1(j,"IM",2)
    if option=="IM2":
        for j in range(2014,2020):
            setdata2(j,"IM",1)
        for j in range(2014,2020):
            setdata2(j,"IM",2)
    if option=="ID1":
        for j in range(2021,YEAR+1):
            setdata1(j,"ID",1)
        for j in range(2021,YEAR+1):
            setdata1(j,"ID",2)
    """
    if option=="IR1":
        for j in range(2021,YEAR+1):
            setdata1(j,"IR",1)
        for j in range(2021,YEAR+1):
            setdata1(j,"IR",2)
    """
    if option=="common1":
        for j in range(2021,YEAR+1):
            setdata1(j,"common",1)
        for j in range(2020,YEAR+1):
            setdata1(j,"common",2)
    if option=="common2":
        for j in range(2014,2020):
            setdata2(j,"common",1)
        for j in range(2014,2020):
            setdata2(j,"common",2)

# ホーム画面
@app.route("/")
def index():
    return render_template("index.html", ServiceName=ServiceName,YEAR=YEAR)

# リザルト画面
@app.route("/result", methods=['POST'])
def result():
    data.clear()
    readtxt()
    selected_options = request.form.getlist('options')
    for i in selected_options:
        getData(i)
    txt_data.clear()
    return render_template("result.html", ServiceName=ServiceName,data=data,columns=columns,YEAR=YEAR)

if __name__ == "__main__":
    threading.Timer(1.0, lambda: webbrowser.open('http://localhost:5000') ).start()
    app.run(debug=False)
    #app.run(debug=True)
