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