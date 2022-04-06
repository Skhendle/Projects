from datetime import datetime as dt
from flask import current_app as app
from flask import make_response, request, jsonify, send_file
from .models import CountriesCovidData, db
from .data_caching import DataRepository



@app.route("/")
def available_places():
    pass

@app.route("/get_country", methods=["GET"])
def get_country_data():
    data_repo = DataRepository()
    if data_repo.checkLocalData():
            return make_response('Data is cached', 201)

    
    data_repo.fetchData()
    return make_response('Data is not cached', 400)