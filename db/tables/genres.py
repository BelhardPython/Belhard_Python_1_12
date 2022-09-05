from db.base import Base
from sqlalchemy import Column, String


class Genres(Base):
    __tablename__ = 'genres'

    id = Column(String(100), nullable=False, primary_key=True)
    name = Column(String(100), nullable=False)
