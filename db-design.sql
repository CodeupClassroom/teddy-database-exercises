USE codeup_test_db;

CREATE TABLE authors (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name  VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);


SHOW TABLES;

DESCRIBE authors;

INSERT INTO authors (first_name, last_name) VALUES
  ('Douglas', 'Adams'),
  ('Mark', 'Twain'),
  ('Kurt', 'Vonnegut');

SELECT *
FROM authors;

DESCRIBE quotes;

CREATE TABLE quotes (
  id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  content   TEXT         NOT NULL,
  author_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

SELECT id
FROM authors
WHERE first_name = 'Douglas' AND last_name = 'Adams';

INSERT INTO quotes (author_id, content) VALUES ((SELECT id
                                                 FROM authors
                                                 WHERE first_name = 'Douglas' AND last_name = 'Adams'), 'I love deadlines. I love the whooshing noise they make as they go by.
');


INSERT INTO quotes (author_id, content) VALUES ((SELECT id
                                                 FROM authors
                                                 WHERE first_name = 'Douglas' AND last_name = 'Adams'), 'Don''t Panic.
');

INSERT INTO quotes (author_id, content) VALUES ((SELECT id
                                                 FROM authors
                                                 WHERE first_name = 'Douglas' AND last_name = 'Adams'), 'Time is an illusion. Lunchtime doubly so.
');

INSERT INTO quotes (author_id, content) VALUES ((SELECT id
                                                 FROM authors
                                                 WHERE first_name = 'Mark' AND last_name = 'Twain'), 'Clothes make the man. Naked people have little or no influence on society.
');

INSERT INTO quotes (author_id, content) VALUES ((SELECT id
                                                 FROM authors
                                                 WHERE first_name = 'Kurt' AND last_name = 'Vonnegut'), 'The universe is a big place, perhaps the biggest.
');

SELECT
  q.content,
  a.first_name,
  a.last_name AS QUOTE
FROM quotes q
  LEFT JOIN authors a ON a.id = q.author_id;

INSERT INTO authors (first_name, last_name) VALUES ('Fer', 'Mendoza');

CREATE TABLE topics (
  id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

DESCRIBE topics;

INSERT INTO topics (name) VALUES
  ('Space and Time'),
  ('Humor'),
  ('Office Life'),
  ('Hitchiker''s Guide to the Galaxy');

SELECT *
FROM topics;


DESCRIBE quotes;

-- Pivot table

CREATE TABLE quote_topic (
  quote_id INTEGER UNSIGNED NOT NULL,
  topic_id INTEGER UNSIGNED NOT NULL,
  FOREIGN KEY (quote_id) REFERENCES quotes (id),
  FOREIGN KEY (topic_id) REFERENCES topics (id)
);

DESCRIBE quote_topic;

INSERT INTO quote_topic (quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
  (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);


SELECT *
FROM quote_topic;

-- Test if the relationship works
select q.content, t.name from quotes q
  join quote_topic qt on q.id = qt.quote_id
  join topics t ON qt.topic_id = t.id
where q.id = 1;


-- Show only the topics for the quote 1, optimized / less expensive
select t.name from quote_topic qt
  join topics t ON qt.topic_id = t.id
where qt.quote_id = 1;

select * from quote_topic where quote_id = 1;