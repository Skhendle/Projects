import requests, json
from .models import CountriesCovidData 
from . import db
# from.data_points import data


class DataRepository:
    def __checkLocalData(self):
        " Checks if there's cached data"
        test_data = CountriesCovidData.query.first()
        if test_data:
            return True
        return False

    def __fetchDataFromSource(self):
        # get recent data from url and store the data in Postgress
        url = "https://covid-api.mmediagroup.fr/v1/cases"
        request = requests.get(url)
        data = json.loads(request.content)
        data_objects = []
        
        try:
            for key, value in data.items():
                data_objects.append(
                    CountriesCovidData(
                        country_name = str(key), 
                        data = json.dumps(value),
                        available_data_points=len(data[key].keys())
                    )
                )

            db.session.bulk_save_objects(data_objects)
            db.session.commit()
            db.session.close()
            return 'Data Cached'
        except Exception as e:
            return 'Data Not Cached, '

    def fetchAvailableCountries(self):
        data = []
        try:
            if self.__checkLocalData() == False:
                self.__fetchDataFromSource()
            
            items = db.session.query(CountriesCovidData).all()
            for item in items:
                data.append({
                    'id': item.id,
                    'name': item.country_name,
                    'available_places': item.available_data_points
                })
        except Exception as e:
            raise e

        return data

    def fetchCountryData(self,id):
        data = []
        try:
            if self.__checkLocalData() == False:
                self.__fetchDataFromSource()

            items = db.session.query(CountriesCovidData).filter(
                CountriesCovidData.id == id
            ).first()
            data.append(items)
            
        except Exception as e:
            raise e

        return data


    def fetchPlaceData(self, country_id, place_name):
        data = []
        try:
            if self.__checkLocalData() == False:
                self.__fetchDataFromSource()
            
            items = db.session.query(CountriesCovidData).filter(
                CountriesCovidData.id == id
            ).first()
            print(items)

            data.append(items)
        except Exception as e:
            raise e

        return data