"""Application routes."""
from datetime import datetime as dt
from encodings import utf_8
import json, io, os
from flask import current_app as app

from flask import make_response, request, jsonify, send_file
from .models import PondEntries, db
import PIL.Image as Image

# TODO: Add route paramaters
# upload pond condition
# upload picture and description

def convertToBinaryData(filename):
    # Convert digital data to binary format
    with open(filename, 'rb') as file:
        blobData = file.read()
    return blobData

@app.route("/add_pond", methods=["POST"])
def add_pond_records():
    """Create a user via query string parameters."""
    data = json.loads(request.data)
    response = make_response()
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Content-Type'] = 'application/json'

    image = Image.open(io.BytesIO(bytes(data['list'])), formats=[data['fileName'].split('.')[1]])
    image.save(data['fileName'])
    record = PondEntries(
            created = dt.now(),
            description = data['description'],
            photo = convertToBinaryData(str(os.getcwd())+'/'+data['fileName']),
            photo_type = data['fileName'].split('.')[1]
        )
    try:
        db.session.add(record)
        db.session.commit()
        print(os.path.exists(str(os.getcwd())+'/'+data['fileName']))
        if os.path.exists(str(os.getcwd())+'/'+data['fileName']):
            os.remove(str(os.getcwd())+'/'+data['fileName'])
        response.status_code = 201
        response.response =  jsonify('Image Successfully Updated')
        return response
    except Exception as e:
        response.status_code = 400
        response.response =  jsonify('Image Successfully Updated')
        return response



@app.route("/get_pond_records", methods=["GET"])
def get_pond_records():
    # Get all pond records available in the database
    try:
        result = PondEntries.query.all()
        response = []
        
        for item in result:

            response.append(
                {
                    'id': item.id,
                    'created': item.created,
                    'description': item.description,
                    'rating': item.rating,
                    # 'photo': item.photo.decode("utf-8") 
                }
            )
        return make_response(jsonify(response),200)
    except Exception as e:
        print(str(e))
        return make_response(str(e), 400)


# request shouild be 'pond_photo?pond_id=1'
@app.route("/pond_photo", methods=["GET"])
def get_pond_photo():
    args = request.args
    try:
        pond_id = args.get("pond_id", default="", type=str)
        result = PondEntries.query.get(int(pond_id))
        filename =  '/app/static/'+str(result.id)+"."+str(result.photo_type)
        image = Image.open(io.BytesIO(result.photo))
        image.save(str(os.getcwd())+filename)
        return send_file(str(os.getcwd())+filename, mimetype='image/png')
    except Exception as e:
        print(str(e))
        return make_response('Invalid Request', 400)




 # Post to method data == {'id':##,'rating':###}
@app.route("/rate_pond", methods=["POST"])
def rate_pond():
    """Create a user via query string parameters."""
    data = json.loads(request.data)

    result = PondEntries.query.get(data['id'])
    if result:
        try:
            result.rating = data['rating']
            db.session.add(result)
            db.session.commit()
            return make_response(jsonify({
                    'id': result.id,
                    'created': result.created,
                    'description': result.description,
                    'rating': result.rating
                }), 201)
        except Exception as e:
            return make_response('Invalid Request', 401)

    return make_response('Invalid Pond Id', 400)