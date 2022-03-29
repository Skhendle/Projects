"""Data models."""
from . import db


class MMSDATA(db.Model):
    """Data model"""

    __tablename__ = "mms_data"
    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, index=False, unique=False, nullable=False)
    description = db.Column(db.String(100), index=False, unique=False, nullable=True)
    rating = db.Column(db.String(80), index=True, unique=False, nullable=True)
    photo = db.Column(db.LargeBinary(length=None), index=False, unique=False, nullable=True)


    def __repr__(self):
        return "<User {}>".format(self.username)