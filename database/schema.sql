CREATE TABLE book (
  id INT PRIMARY KEY NOT NULL,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  publish_date DATE DEFAULT DEFAULT CURRENT_DATE,
  archived BOOLEAN DEFAULT FALSE,
  label_id INT
);

CREATE TABLE label (
  id INT PRIMARY KEY NOT NULL,
  title VARCHAR(100),
  color VARCHAR(100)
);


