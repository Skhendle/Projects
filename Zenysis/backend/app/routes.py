from datetime import datetime as dt
from flask import current_app as app
from flask import make_response, jsonify, request
from .data_repository import DataRepository

# Return a list of countries with number of data points available
@app.route("/", methods=["GET"])
def get_available_countries():
    data_repository = DataRepository()
    try:
        return make_response(jsonify(data_repository.fetchAvailableCountries()),200)
    except Exception as e:
        print(e)
        return make_response('Invalid Request', 400)


# Based on id as input
# request input :'/get_country?id=1'
@app.route("/get_country", methods=["GET"])
def get_country_data():
    args = request.args
    data_repository = DataRepository()
    try:
        id = args.get("id", default="", type=int)
        data =  data_repository.fetchCountryData(id=id)
        return make_response(jsonify(data),200)
    except Exception as e:
        return make_response('Invalid Request', 400)


# Based on id as input
# request input :'/get_available_places?id=1'
@app.route("/get_available_places", methods=["GET"])
def get_available_places():
    args = request.args
    data_repository = DataRepository()
    try:
        id = args.get("id", default="", type=int)
        data =  data_repository.fetchCountryPlaces(country_id=id)
        return make_response(jsonify(data),200)
    except Exception as e:
        
        return make_response('Invalid Request', 400)


# Based on country id and place name as input 
# request should be '/get_place_data?country_id=10&place_name=""'
@app.route("/get_place_data", methods=["GET"])
def get_place_data():
    args = request.args
    data_repository = DataRepository()
    try:
        country_id = args.get("country_id", default="", type=int)
        place_name = args.get("place_name", default="", type=str).strip('""')
        data = data_repository.fetchPlaceData(country_id=country_id, place_name=place_name)
        return make_response(jsonify(data),200)
    except Exception as e:
        return make_response('Invalid Request', 400)