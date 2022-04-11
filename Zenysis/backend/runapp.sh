python3.9 -m venv venv
. venv/bin/activate
export FLASK_CONFIG="$PWD/config.py"
pip install -r requirements.txt
python main.py