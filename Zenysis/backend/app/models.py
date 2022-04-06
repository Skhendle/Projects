"""Data models."""
from . import db
from sqlalchemy.dialects.postgresql import JSON

class CountriesCovidData(db.Model):
    """Data model"""

    __tablename__ = "countries_covid_data"
    id = db.Column(db.Integer, primary_key=True)
    country_name = db.Column(db.String(1024), index=False, unique=True, nullable=True)
    available_data_points = db.Column(db.Integer, index=False, unique=False, nullable=True)
    data = db.Column(JSON)


    def __repr__(self):
        return "<Pond {}>".format(self.description)