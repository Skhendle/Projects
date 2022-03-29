"""Application routes."""
from datetime import datetime as dt
import os
from urllib import response
from flask import current_app as app
from flask import make_response, request, url_for, jsonify
from .models import MMSDATA, db

# TODO: Add route paramaters


@app.route("/", methods=["GET"])
def get_pond_records():
    # Get all pond records available in the database
    try:
        result = MMSDATA.query.all()
        response = []
        for item in result:
            response.add(
                {
                    'id': item('id'),
                    'created': item('created'),
                    'description': item('description'),
                    'rating': item('rating')
                }
            )
        return make_response(jsonify(response),200)
    except Exception as e:
        return make_response(str(e), 400)



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
@app.route("/add_pond", methods=["POST"])
def add_pond_records():
    """Create a user via query string parameters."""
    username = request.args.get("user")
    email = request.args.get("email")
    return {'username':username,'email':email}


 # Post to method data == {'id':##,'rating':###}
@app.route("/rate_pond", methods=["POST"])
def rate_pond():
    """Create a user via query string parameters."""
    data = request.data
    print(data)

    return data