from db.base import Base
from sqlalchemy import Column, String, ForeignKey, Integer


class Users(Base):
    __tablename__ = 'users'

    login = Column(String(100), nullable=False, primary_key=True)
    password = Column(String(100), nullable=False)
    user_typ_id = Column(String(100), ForeignKey('user_type.id'), nullable=False)
    person_id = Column(Integer, ForeignKey('persons.id'), nullable=False)
