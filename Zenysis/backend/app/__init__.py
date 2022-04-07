from distutils.log import debug
from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
db = SQLAlchemy()
migrate = Migrate()
# patch_all()


def create_app():
    """Construct the core application."""
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_envvar('FLASK_CONFIG')
    CORS(app)
    db.init_app(app)
    migrate.init_app(app, db)
    
    

    with app.app_context():
        from . import routes
        db.create_all()
        return app