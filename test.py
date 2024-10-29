import pdfplumber

with pdfplumber.open('static/pdf/2023/IN1.pdf') as pdf:
    text = ''
    for page in pdf.pages:
        text += page.extract_text()
    print(text)