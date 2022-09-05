from db import Session
from db.tables.genres import Genres
from db.tables.persons import Persons

with Session() as db_session:

    # Вфборка с условием
    my_genres = db_session.query(Genres).filter(Genres.name.like('A%'))
    for genres in my_genres:
        print(genres.name)

    # Создание новых записей
    new_persons = Persons(
        id=1,
        name='Kirill',
        surname='Smotritel',
        birth_date='1984-05-17'
    )
    db_session.add(new_persons)
    db_session.commit()

    person_for_delete = Persons(
        id=2,
        name='Zloy',
        surname='Kartofel',
        birth_date='2000-12-12'
    )
    db_session.add(person_for_delete)
    db_session.commit()

    # Редактирование
    my_chenges = db_session.query(Persons).filter(Persons.id == 1)
    my_chenges.update({Persons.surname: 'Redactor'})

    db_session.commit()

    #удаление
    del_person = db_session.query(Persons).filter(Persons.id == 2).first()
    db_session.delete(del_person)
    db_session.commit()
