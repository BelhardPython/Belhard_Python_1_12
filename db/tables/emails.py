from db.base import Base
from sqlalchemy import Column, Integer, String, ForeignKey


class Emails(Base):
    __tablename__ = 'emails'

    id = Column(Integer, nullable=False, primary_key=True)
    email = Column(String(100), nullable=False)
    user_login = Column(String(100), ForeignKey('users.login'), nullable=False)
