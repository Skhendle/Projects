from distutils.log import debug
from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy




def create_app():
    """Construct the core application."""
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_object('config.Config')
    # print(app.config)
    CORS(app)

    db = SQLAlchemy()
    db.init_app(app)
    
    with app.app_context():
        db.create_all()        
        return app