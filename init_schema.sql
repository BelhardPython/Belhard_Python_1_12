# Занятие 12. Работа с РСУБД. SQL. SQLAlchemy

## SQL

# Необходимо составить ```init_schema.sql``` файл, который будет создавать
# базу данных ```film_zone``` со следующей структурой.

# Описать следующие таблицы:

# **persons** - таблица "человек"

# * id [```NOT NULL```, ```INT```, ```PRIMARY KEY```, ```AUTOINCREMENT```] - уникальный идентификатор человека
# * name [```NOT NULL```, ```VARCHAR```] - имя человека
# * surname [```NOT NULL```, ```VARCHAR```] - фамилия человека
# * birth_date [```NOT NULL```, ```DATETIME```] - дата рождения человека


DROP DATABASE IF EXISTS film_zone;
CREATE DATABASE film_zone;
USE film_zone;
CREATE TABLE persons (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    birth_date DATETIME NOT NULL
);

# **user_types** - таблица "типы пользователей"

# * id [```NOT NULL```, ```VARCHAR```, ```PRIMARY KEY```] - уникальный идентификатор типа пользователя
# * name [```NOT NULL```, ```VARCHAR```] - название типа пользователя

# Вставить в таблицу ```user_types``` следующие значения:

# * USER - User
# * ADMIN - Administrator


CREATE TABLE user_types (
    id VARCHAR(50) NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO user_types(id, name) VALUES ('USER', 'User');
INSERT INTO user_types(id, name) VALUES ('ADMIN', 'Administrator');

# **users** - таблица "пользователи"

# * login [```NOT NULL```, ```VARCHAR```, ```PRIMARY KEY```] - логин пользователя
# * password [```NOT NULL```, ```VARCHAR```] - пароль пользователя
# * user_type_id [```NOT NULL```, ```VARCHAR```, ```REFERENCES user_types(id)```] - тип пользователя
# * person_id [```NOT NULL```, ```INT```, ```REFERENCES persons(id)```] - данные пользователя


CREATE TABLE users (
    login VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    user_type_id VARCHAR(50) NOT NULL,
    person_id INT NOT NULL,
    CONSTRAINT fk_users_user_types FOREIGN KEY (user_type_id)
        REFERENCES user_types (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_users_persons FOREIGN KEY (person_id)
        REFERENCES persons (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

# **emails** - таблица "emailы пользователей"

# * id [```NOT NULL```, ```INT```, ```PRIMARY KEY```, ```AUTOINCREMENT```] - уникальный идентификатор email
# * email ```[NOT NULL```, ```VARCHAR```] - email пользователя
# * user_login [```NOT NULL```, ```VARCHAR```, ```REFERENCES users(login)```] - логин пользователя


CREATE TABLE email (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    user_login VARCHAR(50) NOT NULL,
    CONSTRAINT fk_email_users FOREIGN KEY (user_login)
        REFERENCES users (login)
        ON DELETE CASCADE ON UPDATE CASCADE
);

# **genres** - таблица "жанры фильмов"

# * id [```NOT NULL```, ```VARCHAR```, ```PRIMARY KEY```] - уникальный идентификатор жанра фильма
# * name [```NOT NULL```, ```VARCHAR```] - название жанра фильма

# Вставить в таблицу ```genres``` следующие значения:

# * ACTION - Action
# * ADVENTURE - Adventure
# * COMEDY - Comedy
# * DRAMA - Drama
# * CRIME - Crime
# * SCI_FI - sci-fi
# * FANTASY - fantasy
# * MUSICAL - Musical
# * WESTERN - Western
# * POST_APOCALYPTIC - Post-apocalyptic
# * WAR - War
# * FAMILY - Family film
# * LOVE - Love story
# * CARTOON - Cartoon
# * HORROR - Horror
# * THRILLER - Thriller
# * DOCUMENTARY - Documentary


CREATE TABLE genres (
    id VARCHAR(50) NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO genres(id, name) VALUES ('ACTION', 'Action');
INSERT INTO genres(id, name) VALUES ('ADVENTURE', 'Adventure');
INSERT INTO genres(id, name) VALUES ('COMEDY', 'Comedy');
INSERT INTO genres(id, name) VALUES ('DRAMA', 'Drama');
INSERT INTO genres(id, name) VALUES ('CRIME', 'Crime');
INSERT INTO genres(id, name) VALUES ('SCI_FI', 'sci-fi');
INSERT INTO genres(id, name) VALUES ('FANTASY', 'Fantasy');
INSERT INTO genres(id, name) VALUES ('MUSICAL', 'Musical');
INSERT INTO genres(id, name) VALUES ('WESTERN', 'Western');
INSERT INTO genres(id, name) VALUES ('POST_APOCALYPTIC', 'Post-apocalyptic');
INSERT INTO genres(id, name) VALUES ('WAR', 'War');
INSERT INTO genres(id, name) VALUES ('FAMILY', 'Family_film');
INSERT INTO genres(id, name) VALUES ('LOVE', 'Love_story');
INSERT INTO genres(id, name) VALUES ('CARTOON', 'Cartoon');
INSERT INTO genres(id, name) VALUES ('HORROR', 'Horror');
INSERT INTO genres(id, name) VALUES ('THRILLER', 'Thriller');
INSERT INTO genres(id, name) VALUES ('DOCUMENTARY', 'Documentary');


# **films** - таблица "фильмы""

# * id [```NOT NULL```, ```INT```, ```PRIMARY KEY```, ```AUTOINCREMENT```] - уникальный идентификатор фильма
# * duration [```NOT NULL```, ```INT```] - длительность фильма в секундах
# * name [```NOT NULL```, ```VARCHAR```] - название фильма
# * release_date [```NOT NULL```, ```DATETIME```] - дата выхода
# * rating [```NOT NULL```, ```FLOAT```] - рейтинг фильма
# * director_id [```NOT NULL```, ```INT```, ```REFERENCES persons(id)```] - режиссер фильма


CREATE TABLE films (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    duration INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    realese_date DATETIME NOT NULL,
    rating FLOAT NOT NULL,
    director_id INT NOT NULL,
    CONSTRAINT fk_films_presons FOREIGN KEY (director_id)
        REFERENCES persons (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

# **user_favorite_films** - MM связь "любимые фильмы пользователя"

# * user_login [```NOT NULL```, ```VARCHAR```, ```REFERENCES users(login)```] - логин пользователя
# * film_id [```NOT NULL```, ```INT```, ```REFERENCES films(id)```] - id фильма


CREATE TABLE user_favorite_films (
    user_login VARCHAR(50) NOT NULL,
    film_id INT NOT NULL,
    CONSTRAINT fk_user_favorite_films_users FOREIGN KEY (user_login)
        REFERENCES users (login)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_favorite_films_films FOREIGN KEY (film_id)
        REFERENCES films (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

# **films_genres** - MM связь "жанры фильмов"

# * film_id [```NOT NULL```, ```INT```, ```REFERENCES films(id)```] - id фильма
# * film_genre_id [```NOT NULL```, ```VARCHAR```, ```REFERENCES genres(id)```] - id жанра


CREATE TABLE films_genres (
    film_id INT NOT NULL,
    film_genre_id VARCHAR(50) NOT NULL,
    CONSTRAINT fk_film_genres_films FOREIGN KEY (film_id)
        REFERENCES films (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_film_genres_genres FOREIGN KEY (film_genre_id)
        REFERENCES genres (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

# **characters** - таблица "персонажи фильмов"

# * id [```NOT NULL```, ```INT```, ```PRIMARY KEY```, ```AUTOINCREMENT```] - уникальный идентификатор персонажа
# * name [```NOT NULL```, ```VARCHAR```] - имя персонажа
# * comment [```VARCHAR```] - комментарий
# * film_id [```NOT NULL```, ```INT```, ```REFERENCES films(id)```] - id фильма


CREATE TABLE characters (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    comment VARCHAR(50),
    film_id INT NOT NULL,
    CONSTRAINT fk_characters_films FOREIGN KEY (film_id)
        REFERENCES films (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

# **characters_actors** - MM связь "актеры, играющие персонажей"

# * character_id [```NOT NULL```, ```INT```, ```REFERENCES characters(id)```] - id персонажа
# * person_id [```NOT NULL```, ```INT```, ```REFERENCES persons(id)```] - id человека


CREATE TABLE characters_actors (
    character_id INT NOT NULL,
    person_id INT NOT NULL,
    CONSTRAINT fk_characters_actors_characters FOREIGN KEY (character_id)
        REFERENCES characters (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_characters_actors_persons FOREIGN KEY (person_id)
        REFERENCES persons (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


# ***

# Полученная схема должна выглядеть следующим образом:

# ![Database schema](schema.png)

# ## SQLAlchemy

# 1. Создать пакет ```db```.
# 2. Создать модуль ```base.by```:

#    ```python
#     from sqlalchemy.ext.declarative import declarative_base

#     Base = declarative_base()
#     ```

# 3. Создать модуль ```session.by```:

#    ```python
#    from sqlalchemy import create_engine
#    from sqlalchemy.orm import sessionmaker
#    from contextlib import contextmanager


#    engine = create_engine(
#        'mysql+pymysql://user:password@localhost:3306/database',
#        pool_pre_ping=True,
#        pool_recycle=3600,
#    )
#    Session = sessionmaker(bind=engine)


#    @contextmanager
#    def session_scope():
#        session = Session()
#        try:
#            yield session
#            session.commit()
#        except:
#            session.rollback()
#            raise
#        finally:
#            session.close()
#    ```

# 4. Создать в пакете ```db``` пакет ```tables```.
# 5. В пакете ```tables``` описать таблицы из задания по SQL
# 6. Сделать файл ```__init__.py``` в пакете ```db``` и в пакете ```tables```и описать в нем инструкции импорта пакета.
# 7. Сделать в корне модуль ```run.py```, в котором произвести следующие операции:

#    * Вставка в таблицу
#    * Удаление из таблицы
#    * Выборка с условием
#    * Редактирование элемента
