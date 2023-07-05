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

CREATE INDEX label_idx ON books (label_id);

