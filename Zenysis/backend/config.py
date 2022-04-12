#from os import environ, path, 
import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, ".env"))


class Config(object):
    """Set Flask configuration from .env file."""

    # General Config
    FLASK_ENV = os.environ.get("FLASK_ENV")
    SECRET_KEY = os.environ.get("SECRET_KEY")
#     SQLALCHEMY_DATABASE_URI = None
    if FLASK_ENV == "development":
        SQLALCHEMY_DATABASE_URI = 'sqlite:///'+os.path.join(basedir, 'dev-data.db')
#        str('sqlite:///'+str(os.getcwd())+'/x_database.db')
    else:
    # DB Config
        DB_USER=os.environ.get("DB_USER")
        DB_PASS=os.environ.get("DB_PASS")
        DB_HOST=os.environ.get("DB_HOST")
        DB_NAME=os.environ.get("DB_NAME")

        # print(str(f"postgresql+pg8000://{DB_USER}:{DB_PASS}@{DB_HOST}:5432/{DB_NAME}"))
        # SQLALCHEMY_DATABASE_URI = str(f"postgresql+pg8000://{DB_USER}:{DB_PASS}@{DB_HOST}:5432/{DB_NAME}")
        SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL')

    SQLALCHEMY_ECHO = False
    SQLALCHEMY_TRACK_MODIFICATIONS = True