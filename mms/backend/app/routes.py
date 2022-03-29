"""Application routes."""
from datetime import datetime as dt

from flask import current_app as app
from flask import make_response, redirect, render_template, request, url_for, jsonify
from .models import MMSDATA, db

# TODO: Add route paramaters

@app.route("/", methods=["GET"])
def get_pond_records():
    # Get all pond records available in the database
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}



@app.route("/pond_photo/<pond_id>", methods=["GET"])
def get_pond_photo(pond_id:int):
    # Return blob related to pond_id
    try:
        pond_id = int(pond_id)
        return {'pond_id':pond_id}
    except Exception as e:
        return make_response('Invalid Request', 400)


# upload pond condition
# upload picture and description
@app.route("/post", methods=["POST"])
def add_pond_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}


 # Post to method data == {'id':##,'rating':###}
@app.route("/rate", methods=["POST"])
def rate_pond():
    """Create a user via query string parameters."""
    data = request.data
    print(data)

    return data