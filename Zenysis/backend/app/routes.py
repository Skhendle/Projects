from datetime import datetime as dt
from flask import current_app as app
from flask import make_response, jsonify, request
from .data_repository import DataRepository

# TODO:
# Return The list of countries with number of data points available
@app.route("/", methods=["GET"])
def get_available_countries():
    data_repository = DataRepository()
    try:
        return make_response(jsonify(data_repository.fetchAvailableCountries()),200)
    except Exception as e:
        print(e)
        return make_response('Invalid Request', 400)


# Extend route to allow countryName input
# Get country base on name input
# request input :'get_country?id=1'
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

# TODO:
# 1. Get data for the selected place
# Based on country and place name 
# request shouild be 'get_place?country_id=10&get_place=""'
@app.route("/place_data", methods=["GET"])
def get_place_data():
    args = request.args
    data_repository = DataRepository()
    try:
        return make_response(jsonify(data_repository.fetchPlaceData(id= args.get("id", default="", type=int))),200)
    except Exception as e:
        return make_response('Invalid Request', 400)