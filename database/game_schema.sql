CREATE TABLE Authors (
  id  INTEGER PRIMARY KEY,
  first_name varchar(100),
  last_name varchar(100)
);

CREATE TABLE Items (
  id SERIAL PRIMARY KEY,
  author_id INTEGER REFERENCES authors(id),
  publish_date DATE,
  archived BOOLEAN
);


CREATE TABLE Game (
  id INTEGER PRIMARY KEY,
  multiplayer varchar(100),
  last_played_at DATE,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (id) REFERENCES Items(id)
);

UPDATE Game
SET archived = true
WHERE publish_date <= CURRENT_DATE - INTERVAL '10 years'
AND last_played_at <= CURRENT_DATE - INTERVAL '2 years';
