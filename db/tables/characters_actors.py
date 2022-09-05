from db.base import Base
from sqlalchemy import Column, Integer, ForeignKey


class CharactersActors(Base):
    __tablename__ = 'characters_actors'

    character_id = Column(Integer, ForeignKey('characters.id'), nullable=False)
    person_id = Column(Integer, ForeignKey('persons.id'), nullable=False)
    