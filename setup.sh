curl -L -o python.zip https://www.python.org/ftp/python/3.12.3/python-3.12.3-embed-amd64.zip
unzip python.zip -d python
rm -f python.zip
chmod -R 755 python

cd python
echo "import site" >> python312._pth

curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
echo "import sys; sys.path.append('')" >> setting.pth

./python.exe get-pip.py
./python.exe -m pip install --upgrade pip

./python.exe -m pip install -r ../requirements.txt

git config --local core.filemode false