CREATE TABLE items (
  id INT PRIMARY KEY NOT NULL,
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE,
  label_id INT,

  -- more one-to-many connections 
);

CREATE TABLE book (
  item_id INT PRIMARY KEY NOT NULL,
  publisher VARCHAR(100),
  cover_state VARCHAR(100)
);

CREATE TABLE label (
  id INT PRIMARY KEY NOT NULL,
  title VARCHAR(100),
  color VARCHAR(100)
);

ALTER TABLE items ADD CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label (id);
ALTER TABLE book ADD CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES items (id);

UPDATE items 
SET archived = TRUE
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years'
OR id IN (SELECT item_id FROM book WHERE cover_state = 'bad');

