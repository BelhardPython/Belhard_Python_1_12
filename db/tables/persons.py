from sqlalchemy import Column, Integer, String, DATETIME
from db.base import Base


class Persons(Base):
    __tablename__ = 'persons'
    id = Column(Integer, nullable=False, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    surname = Column(String(100), nullable=False)
    birth_date = Column(DATETIME, nullable=False)
