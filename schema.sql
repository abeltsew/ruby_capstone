CREATE DATABASE things;

CREATE TABLE Label(
    id int generated always as identity,
    title varchar(50),
    color varchar(50),
    publish_date date,
    primary key (id)
);

CREATE TABLE books(
    id Int generated always as identity,
    publisher  varchar(50) ,
    cover_status  varchar(50),
    publish_date  date,
    archived  boolean,
    label_id  Int,
    CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
    PRIMARY KEY (id)
);

CREATE TABLE Author(
    id int generated always as identity,
    first_name varchar(50),
    last_name varchar(50),
    primary key (id)
);

CREATE TABLE Games(
    id Int generated always as identity,
    multplayer  boolean,
    last_played_at  date,
    publish_date  date,
    archived  boolean,
    author_id  int,
    CONSTRAINT fk_label FOREIGN KEY (author_id) REFERENCES Author(id),
    PRIMARY KEY (id)
);

CREATE TABLE genres(
    id int generated always as identity,
    name varchar(50),
    primary key (id)
);

CREATE TABLE music_album(
    id Int generated always as identity,
    publish_date  date,
    on_spotify  boolean,
    archived  boolean,
    genre_id  Int,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id),
    PRIMARY KEY (id)
);

CREATE INDEX genres ON music_album (genre_id);
CREATE INDEX label_idx ON books (label_id);
