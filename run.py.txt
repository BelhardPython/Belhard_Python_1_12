from db.session import Session
from db.tables import tables


with Session() as db_session:
    new_person = tables.Persons(name='Emi', surname='Dobrian', birth_date='22/07/1999')
    db_session.add(new_person)
    db_session.commit()

    my_user = db_session.query(tables.Persons).filter(tables.Persons.id == 1).first()
    db_session.delete(my_user)
    db_session.commit()

    my_user = db_session.query(tables.Persons).filter(tables.Persons.id == 2).first()

    change_user = db_session.query(tables.Persons).filter(tables.Persons.id == 1).first()
    change_user.name = 'New'
    db_session.commit()