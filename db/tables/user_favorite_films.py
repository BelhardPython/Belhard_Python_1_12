from db.base import Base
from sqlalchemy import Column, String, ForeignKey, Integer


class UserFavoriteFilms(Base):
    __tablename__ = 'user_favorite_films'

    id = Column(String(100), ForeignKey('Users.login'), nullable=False)
    name = Column(Integer, ForeignKey('Films.id'), nullable=False)
