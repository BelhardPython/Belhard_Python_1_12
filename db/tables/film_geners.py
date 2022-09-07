from db.base import Base
from sqlalchemy import Column, Integer, ForeignKey


class FilmsGenres(Base):
    __tablename__ = 'films_genres'

    film_id = Column(Integer, ForeignKey('films.id'), nullable=False)
    name = Column(String(100), ForeignKey('genres.id'), nullable=False)