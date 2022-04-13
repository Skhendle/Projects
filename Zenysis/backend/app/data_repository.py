import requests, json
from .models import CountriesCovidData 
from . import db
import json
import random
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
        
        except Exception as e:
            raise e

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
        finally:
            db.session.close()
            pass

        return data

    def fetchCountryData(self,id:int):
        response = None
        try:
            if self.__checkLocalData() == False:
                self.__fetchDataFromSource()

            data_obj = db.session.query(CountriesCovidData).filter(
                CountriesCovidData.id == id
            ).first()
            item =  json.loads(data_obj.data)
            response = item['All']
            
        except Exception as e:
            raise e
        finally:
            db.session.close()

        return response

    def deathTollData(self,country_id:int):
        response = []
        try:
            if self.__checkLocalData() == False:
                self.__fetchDataFromSource()

            data_obj = db.session.query(CountriesCovidData).filter(
                CountriesCovidData.id == country_id
            ).first()
            item =  json.loads(data_obj.data)
            map_keys = [key for key in item.keys()]
            map_keys.remove("All")
            
            for mapKey in map_keys:
                response.append({
                    'title': mapKey,
                    'value': item.get(mapKey)['deaths'],
                    'color': '#'+''.join([random.choice('0123456789ABCDEF') for j in range(6)])
                })
            
        except Exception as e:

            raise e
        finally:
            db.session.close()

        return response


    def fetchPlaceData(self, country_id:int, place_name:str):
        response = None
        try:
            if self.__checkLocalData() == False:
                self.__fetchDataFromSource()
            
            data_obj = db.session.query(CountriesCovidData).filter(
                CountriesCovidData.id == country_id
            ).first()
            item =  json.loads(data_obj.data)
            response = item.get(place_name)
        except Exception as e:

            raise e
        finally:
            db.session.close()

        return response