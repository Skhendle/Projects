"""Application routes."""
from datetime import datetime as dt

from flask import current_app as app
from flask import make_response, redirect, render_template, request, url_for

from .models import MMSDATA, db

# TODO: Add route paramaters

@app.route("/", methods=["GET"])
def get_pond_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}


@app.route("/post", methods=["GET"])
def add_pond_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}

@app.route("/rate", methods=["Post"])
def rate_pond():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}