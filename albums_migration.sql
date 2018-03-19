USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (

  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artist VARCHAR(120),
  name VARCHAR(120),
  release_date INT,
  sales DECIMAL(6, 2),
  genre VARCHAR(120),
  PRIMARY KEY (id)

);