-- Create Author table
DROP TABLE IF EXISTS Author;
CREATE TABLE Author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);
-- Create Item Table
DROP TABLE IF EXISTS Item;
CREATE TABLE Item(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date date,
  archived boolean,
  author_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fkey_author
    FOREIGN KEY (author_id)
      REFERENCES Author(id)
      ON DELETE SET NULL
);
-- Ensure move_to_archive method for item table
UPDATE ITEM
SET archived = TRUE
WHERE (SELECT(CURRENT_DATE - publish_date) AS YEARS) > 10;
--Create Game table
DROP TABLE IF EXISTS Game;
CREATE TABLE Game(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date date,
  archived boolean,
  author_id INT,
  multiplayer VARCHAR(100),
  last_played_at date,
  CONSTRAINT fkey_author
    FOREIGN KEY(author_id)
      REFERENCES Author(id)
      ON DELETE SET NULL
);
-- Ensure move_to_archive method for Game table
UPDATE Game
SET archived = TRUE
WHERE ((SELECT(CURRENT_DATE - publish_date) AS YEARS) > 10) AND ((SELECT(CURRENT_DATE - last_played_at)AS YEARS) >2)
;