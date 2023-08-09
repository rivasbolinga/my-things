SELECT * FROM book;
SELECT * FROM label;

SELECT * FROM book
WHERE AGE(CURRENT_DATE, publish_date) > INTERVAL '10 years' OR cover_state = 'bad';