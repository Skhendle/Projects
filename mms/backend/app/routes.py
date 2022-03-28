"""Application routes."""
from datetime import datetime as dt

from flask import current_app as app
from flask import make_response, redirect, render_template, request, url_for

from .models import MMSDATA, db


@app.route("/", methods=["GET"])
def user_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}


@app.route("/post", methods=["GET"])
def user_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}

@app.route("/rate", methods=["Post"])
def user_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}