CREATE DATABASE catalog_of_things;


	CREATE TABLE Label(
    id      INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    title   VARCHAR(50),
    color   VARCHAR(50)
    );

CREATE TABLE Genre(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50)
    );

CREATE TABLE Book(
  id            INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  genre_id      INTEGER,
  author_id     INTEGER,
  label_id      INTEGER,
  publish_date  DATE,
  archived      BOOLEAN,
  publisher     VARCHAR(50),
  cover_state   VARCHAR(10),

  FOREIGN KEY (genre_id)  REFERENCES Genre(id)
  FOREIGN KEY (author_id) REFERENCES Author(id)
  FOREIGN KEY (label_id)  REFERENCES Label(id)
);

CREATE TABLE MusicAlbum(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    publish_date  DATE,
    archived      BOOLEAN,
    on_spotify VARCHAR(50),
    name VARCHAR(50),
    FOREIGN KEY(genre_id)  REFERENCES Genre(id),
    FOREIGN KEY(author_id) REFERENCES Author(id),
    FOREIGN KEY(label_id)  REFERENCES Label(id)
);
