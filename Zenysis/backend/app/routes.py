from datetime import datetime as dt
from flask import current_app as app
from flask import make_response, request, jsonify, send_file
from .models import CountriesCovidData, db
from .data_caching import DataRepository

# TODO:
# Return The list of countries with number of data points available
@app.route("/")
def get_available_countries():
    data_repository = DataRepository()
    try:
        return make_response(jsonify(data_repository.fetchAvailableCountries()),200)
    except Exception as e:
        return make_response('Invalid Request', 400)

# TODO:
# Extend route to allow countryName input
# Get country base on name input
@app.route("/get_country", methods=["GET"])
def get_country_data():
    data_repo = DataRepository()
    if data_repo.checkLocalData():
            return make_response('Data is cached', 201)

    data_repo.fetchDataFromSource()
    return make_response('Data is not cached', 400)

# TODO:
# 1. Get data for the selected place
# Based on country and place name 
# request shouild be 'get_place?country_name=""&get_place=""'
@app.route("/place_data", methods=["GET"])
def get_place_data():
    data_repo = DataRepository()
    if data_repo.checkLocalData():
        return make_response('Data is cached', 201)

    
    data_repo.fetchData()
    return make_response('Data is not cached', 400)