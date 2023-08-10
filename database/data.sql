INSERT INTO label (id, title, color)
VALUES (1, 'Gift', 'Red');
INSERT INTO label (id, title, color)
VALUES (2, 'New', 'Green');
INSERT INTO label (id, title, color)
VALUES (3, 'Special', 'Blue');

INSERT INTO items (id, publish_date, label_id)
VALUES (1, '2021-06-08', 2);
INSERT INTO items (id, publish_date, label_id)
VALUES (2, '2011-12-05', 1);
INSERT INTO items (id, publish_date, label_id)
VALUES (3, '2022-12-25', 3);
INSERT INTO items (id, publish_date, label_id)
VALUES (4, '2020-02-03', 2);
INSERT INTO items (id, publish_date, label_id)
VALUES (5, '2023-01-01', 2);
INSERT INTO items (id, publish_date, label_id)
VALUES (6, '2021-03-15', 3);
INSERT INTO items (id, publish_date, label_id)
VALUES (7, '2022-04-03', 1);
INSERT INTO items (id, publish_date, label_id)
VALUES (8, '2023-07-05', 2);
INSERT INTO items (id, publish_date, label_id)
VALUES (9, '2010-05-11', 1);

INSERT INTO book (item_id, publisher, cover_state)
VALUES (1, 'Jack', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (2, 'Lexa', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (3, 'Jon', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (4, 'Octavia', 'bad');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (5, 'Hanna', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (6, 'Sam', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (7, 'Bellamy', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (8, 'Jesse', 'good');
INSERT INTO book (item_id, publisher, cover_state)
VALUES (9, 'Sansa', 'bad');