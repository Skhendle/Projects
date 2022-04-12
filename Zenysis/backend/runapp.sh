python3.9 -m venv venv
. venv/bin/activate
pip install -r requirements.txt
FLASK_CONFIG="$PWD/config.py"
python main.py