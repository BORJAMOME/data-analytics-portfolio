-- We create the database
CREATE DATABASE library;

-- We use the 'library' database
USE library;

-- We create the 'users' table
CREATE TABLE IF NOT EXISTS users(
	_id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    primary key (_id)
);

-- We create the 'thematic' table
CREATE TABLE IF NOT EXISTS thematic(
	_id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(45) NULL,
	primary key (_id)
);


-- We create the 'author' table
CREATE TABLE IF NOT EXISTS author(
	_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NULL,
    primary key (_id)
);


-- We create the 'books' table
CREATE TABLE IF NOT EXISTS `library`.`books` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `author_id` INT NOT NULL,
  `thematic_id` INT NOT NULL,
  `year` VARCHAR(4) NULL,
  PRIMARY KEY (`_id`),
  INDEX `author_id_idx` (`author_id` ASC),
  INDEX `thematic_id_idx` (`thematic_id` ASC),
  CONSTRAINT `author_id`
    FOREIGN KEY (`author_id`)
    REFERENCES `library`.`author` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `thematic_id`
    FOREIGN KEY (`thematic_id`)
    REFERENCES `library`.`thematic` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- We create the 'lends' table
CREATE TABLE IF NOT EXISTS `library`.`lends` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `returned` INT NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `book_id_idx` (`book_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `library`.`users` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `library`.`books` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- We insert values into the 'users' table.

INSERT INTO users (name, lastname, email) VALUES ("Ethan", "Johnson", "ethanjohnson@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Olivia", "Smith", "oliviasmith@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Liam", "Williams", "liamwilliams@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Ava", "Jones", "avajones@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Noah", "Brown", "noahbrown@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Emma", "Taylor", "emmataylor@example.com");
INSERT INTO users (name, lastname, email) VALUES ("William", "Davies", "williamdavies@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Sophia", "Evans", "sophiaevans@example.com");
INSERT INTO users (name, lastname, email) VALUES ("James", "Wilson", "jameswilson@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Isabella", "Thomas", "isabellathomas@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Oliver", "Roberts", "oliverroberts@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Mia", "Green", "miagreen@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Benjamin", "Clark", "benjaminclark@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Charlotte", "Hill", "charlottehill@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Elijah", "Hughes", "elijahhughes@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Amelia", "Walker", "ameliawalker@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Lucas", "Lewis", "lucaslewis@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Harper", "King", "harperking@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Mason", "Turner", "masonturner@example.com");
INSERT INTO users (name, lastname, email) VALUES ("Evelyn", "White", "evelynwhite@example.com")


-- We insert values into the 'thematic' table with all literary themes
INSERT INTO thematic (name) VALUES ("Fantasy");
INSERT INTO thematic (name) VALUES ("Horror");
INSERT INTO thematic (name) VALUES ("Science Fiction");
INSERT INTO thematic (name) VALUES ("Mystery");
INSERT INTO thematic (name) VALUES ("Romance");
INSERT INTO thematic (name) VALUES ("Adventure");
INSERT INTO thematic (name) VALUES ("Historical Fiction");
INSERT INTO thematic (name) VALUES ("Thriller");
INSERT INTO thematic (name) VALUES ("Biography");
INSERT INTO thematic (name) VALUES ("Self-help");
INSERT INTO thematic (name) VALUES ("Poetry");
INSERT INTO thematic (name) VALUES ("Humor");
INSERT INTO thematic (name) VALUES ("Drama");
INSERT INTO thematic (name) VALUES ("Action");
INSERT INTO thematic (name) VALUES ("Children's");
INSERT INTO thematic (name) VALUES ("Young Adult");

-- We insert values into the 'author' table
INSERT INTO author (name) VALUES ("J.R.R. Tolkien"); -- Fantasy
INSERT INTO author (name) VALUES ("Stephen King"); -- Horror
INSERT INTO author (name) VALUES ("Isaac Asimov"); -- Science Fiction
INSERT INTO author (name) VALUES ("Agatha Christie"); -- Mystery
INSERT INTO author (name) VALUES ("Jane Austen"); -- Romance
INSERT INTO author (name) VALUES ("Jules Verne"); -- Adventure
INSERT INTO author (name) VALUES ("Ken Follett"); -- Historical Fiction
INSERT INTO author (name) VALUES ("Dan Brown"); -- Thriller
INSERT INTO author (name) VALUES ("Walter Isaacson"); -- Biography
INSERT INTO author (name) VALUES ("Dale Carnegie"); -- Self-help
INSERT INTO author (name) VALUES ("Rumi"); -- Poetry
INSERT INTO author (name) VALUES ("Mark Twain"); -- Humor
INSERT INTO author (name) VALUES ("William Shakespeare"); -- Drama
INSERT INTO author (name) VALUES ("Tom Clancy"); -- Action
INSERT INTO author (name) VALUES ("Dr. Seuss"); -- Children's
INSERT INTO author (name) VALUES ("J.K. Rowling"); -- Young Adult


-- Inserting books associated with the previously created authors and literary themes
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Fellowship of the Ring", 1, 1, 1954); -- Fantasy (J.R.R. Tolkien)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Shining", 2, 2, 1977); -- Horror (Stephen King)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Foundation", 3, 3, 1951); -- Science Fiction (Isaac Asimov)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Murder on the Orient Express", 4, 4, 1934); -- Mystery (Agatha Christie)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Pride and Prejudice", 5, 5, 1813); -- Romance (Jane Austen)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Twenty Thousand Leagues Under the Sea", 6, 6, 1870); -- Adventure (Jules Verne)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Pillars of the Earth", 7, 7, 1989); -- Historical Fiction (Ken Follett)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Da Vinci Code", 8, 8, 2003); -- Thriller (Dan Brown)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Steve Jobs", 9, 9, 2011); -- Biography (Walter Isaacson)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("How to Win Friends and Influence People", 10, 10, 1936); -- Self-help (Dale Carnegie)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Essential Rumi", 11, 11, 1995); -- Poetry (Rumi)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Adventures of Tom Sawyer", 12, 12, 1876); -- Humor (Mark Twain)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Romeo and Juliet", 13, 13, 1597); -- Drama (William Shakespeare)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("The Hunt for Red October", 14, 14, 1984); -- Action (Tom Clancy)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Green Eggs and Ham", 15, 15, 1960); -- Children's (Dr. Seuss)
INSERT INTO books (name, author_id, thematic_id, year) VALUES ("Harry Potter and the Philosopher's Stone", 16, 16, 1997); -- Young Adult (J.K. Rowling)

-- We insert values into the 'lends' table
INSERT INTO lends (user_id, book_id, date, returned) VALUES (1, 1, '2020-06-20', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (7, 14, '2023-02-15', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (4, 9, '2023-11-09', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (19, 2, '2023-07-23', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (5, 5, '2023-04-30', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (11, 11, '2023-05-12', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (9, 8, '2023-08-07', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (3, 3, '2023-10-18', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (6, 13, '2023-03-27', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (10, 6, '2023-09-05', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (13, 8, '2023-05-25', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (2, 4, '2023-12-19', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (8, 12, '2023-11-01', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (14, 14, '2023-07-02', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (20, 16, '2023-01-20', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (15, 7, '2023-09-10', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (18, 10, '2023-03-03', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (1, 15, '2023-06-28', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (16, 1, '2023-08-13', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (12, 3, '2023-10-06', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (17, 8, '2023-12-27', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (11, 5, '2023-02-25', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (8, 6, '2023-09-19', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (5, 11, '2023-04-14', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (2, 15, '2023-06-08', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (9, 9, '2023-01-10', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (10, 2, '2023-05-06', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (4, 3, '2023-10-30', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (14, 4, '2023-08-24', 0);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (3, 12, '2023-11-16', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (19, 7, '2023-07-07', 1);
INSERT INTO lends (user_id, book_id, date, returned) VALUES (13, 10, '2023-02-19', 0);

-- How many books are there in total in the database?
SELECT COUNT(*) AS total_books
FROM books;

-- How many users are registered in the database?
SELECT COUNT(*) AS total_usuarios
FROM users;

-- How many books has a particular user borrowed?
SELECT COUNT(*) AS borrowed_books
FROM lends
WHERE user_id = 1;


-- What are the available books in a specific topic?
SELECT name AS book_name
FROM books
WHERE thematic_id = 5;

-- What are the 5 oldest books in the database?
SELECT name, year AS oldest_book
FROM books
ORDER BY year ASC
LIMIT 5;


-- What is the total number of loans made in the database?
SELECT COUNT(*) AS total_lends
FROM lends;

-- How many books are currently on loan?
SELECT COUNT(*) AS borrowed_books
FROM lends
WHERE returned = 0;


-- How many books have users borrowed and sort them from highest to lowest?
SELECT user_id, COUNT(*) AS borrowed_books
FROM lends
GROUP BY user_id
ORDER BY borrowed_books DESC;


-- What are the most popular books in the database?
SELECT b.name AS most_popular_book, COUNT(*) AS total_borrowed
FROM lends l
JOIN books b ON l.book_id = b._id
GROUP BY l.book_id
ORDER BY total_borrowed DESC
LIMIT 5;


-- Which user has borrowed the most books in total?
SELECT users.name, users.lastname,lends.user_id, COUNT(*) AS total_borrowed_books
FROM lends
JOIN users ON lends.user_id = users._id
GROUP BY lends.user_id, users.name, users.lastname
ORDER BY total_borrowed_books DESC
LIMIT 1;

-- How many books have been returned and how many are still on loan?
SELECT
    SUM(CASE WHEN returned = 1 THEN 1 ELSE 0 END) AS returned_books,
    SUM(CASE WHEN returned = 0 THEN 1 ELSE 0 END) AS borrowed_books
FROM lends;