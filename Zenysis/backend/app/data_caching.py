import requests, json
from .models import CountriesCovidData, db
# from.data_points import data


class DataRepository:
    def checkLocalData(self):
        " Checks if there' is cached data"
        test_data = CountriesCovidData.query.first()
        if test_data:
            return True
        return False

    def fetchData(self):
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


