CREATE TABLE items (
  id INT PRIMARY KEY NOT NULL,
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE,
  label_id INTEGER REFERENCES label(id),
  author_id INTEGER REFERENCES authors(id),
  genre_id INTEGER REFERENCES genres(id),
);

CREATE TABLE book (
  item_id INT PRIMARY KEY NOT NULL,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE label (
  id INT PRIMARY KEY NOT NULL,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE game (
  item_id INTEGER PRIMARY KEY,
  multiplayer varchar(100),
  last_played_at DATE,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE authors (
  id  INTEGER PRIMARY KEY,
  first_name varchar(100),
  last_name varchar(100)
);

CREATE TABLE music_albums (
  item_id INTEGER PRIMARY KEY,
  on_spotify BOOLEAN,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

UPDATE items 
SET archived = TRUE
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years'
OR id IN (SELECT item_id FROM book WHERE cover_state = 'bad');

UPDATE items 
SET archived = TRUE
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years'
AND id IN (SELECT item_id FROM game WHERE AGE(CURRENT_DATE, last_played_at) > INTERVAL '2 years');

UPDATE items
SET archived = TRUE
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years'
AND id IN (SELECT item_id FROM music_albums WHERE on_spotify = TRUE);

