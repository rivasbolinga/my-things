CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre_id INTEGER REFERENCES genres(id),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE music_albums (
  item_id INTEGER PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  FOREIGN KEY (item_id) REFERENCES items(id)
  FOREIGN key (genre_id) REFERENCES genres(id)
);

UPDATE items
SET archived = true
WHERE AGE(current_date, publish_date) >= (10 * 365.25);

UPDATE music_albums
SET archived = true
WHERE AGE(current_date, publish_date) >= (10 * 365.25);