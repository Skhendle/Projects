#from os import environ, path, 
import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, ".env"))


class Config:
    """Set Flask configuration from .env file."""

    # General Config
    SECRET_KEY = os.environ.get("SECRET_KEY")
    FLASK_APP = os.environ.get("FLASK_APP")
    FLASK_ENV = os.environ.get("FLASK_ENV")

    # DB Config
    DB_USER=os.environ.get("DB_USER")
    DB_PASS=os.environ.get("DB_PASS")
    DB_HOST=os.environ.get("DB_HOST")
    DB_NAME=os.environ.get("DB_NAME")

    SQLALCHEMY_DATABASE_URI = str('sqlite:///'+str(os.getcwd())+'/x_database.db')
    # SQLALCHEMY_DATABASE_URI = str(f"postgresql+pg8000://{DB_USER}:{DB_PASS}@{DB_HOST}:5432/{DB_NAME}")
    # Database
    # if FLASK_ENV == "development":
    #     SQLALCHEMY_DATABASE_URI = str('sqlite:///'+str(os.getcwd())+'/x_database.db')
    # else:
    #     # print(str(f"postgresql+pg8000://{DB_USER}:{DB_PASS}@{DB_HOST}:5432/{DB_NAME}"))
    #     SQLALCHEMY_DATABASE_URI = str(f"postgresql+pg8000://{DB_USER}:{DB_PASS}@{DB_HOST}:5432/{DB_NAME}")
    #environ.get("SQLALCHEMY_DATABASE_URI")
    SQLALCHEMY_ECHO = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False