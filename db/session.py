from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker
from contextlib import contextmanager

engine = create_engine(
    'mysql+pymysql://root:011016aAk!@localhost:3306/film_zone',
    pool_pre_ping=True,
    pool_recycle=3600,
)
Session = sessionmaker(bind=engine)

@contextmanager
def session_scope():
    session = Session()
    try:
        yield session
        session.commit()
    except:
        session.rollback()
        raise
    finally:
        session.close()
