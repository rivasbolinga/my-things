CREATE TABLE book (
  id INT PRIMARY KEY NOT NULL,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE,
  label_id INT
);

CREATE TABLE label (
  id INT PRIMARY KEY NOT NULL,
  title VARCHAR(100),
  color VARCHAR(100)
);

ALTER TABLE book 
ADD CONSTRAINT label_constraint
FOREIGN KEY (label_id) 
REFERENCES label (id);

SELECT * FROM book
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years' OR cover_state = 'bad';


UPDATE book SET archived = TRUE
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years' OR cover_state = 'bad';