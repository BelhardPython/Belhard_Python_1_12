from db.base import Base
from sqlalchemy import Column, Integer, String, ForeignKey


class Characters(Base):
    __tablename__ = 'characters'

    id = Column(Integer, nullable=False, primary_key=True)
    name = Column(String(100), nullable=False)
    comment = Column(String(100), nullable=True)
    film_id = Column(Integer, ForeignKey('films.id'), nullable=False)
