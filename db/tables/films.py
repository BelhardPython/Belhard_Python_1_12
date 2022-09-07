from db.base import Base
from sqlalchemy import Column, String, Float, Integer, DATETIME, ForeignKey


class Films(Base):
    __tablename__ = 'films'

    id = Column(Integer, nullable=False, primary_key=True)
    duration = Column(Integer, nullable=False)
    name = Column(String(100), nullable=False)
    release_date = Column(DATETIME, nullable=False)
    rating = Column(Float, nullable=False)
    director_id = Column(Integer, ForeignKey('persons.login'), nullable=False)