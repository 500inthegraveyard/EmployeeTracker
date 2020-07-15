DROP DATABASE IF EXISTS EmployeeTracker_db;
CREATE DATABASE EmployeeTracker_db;
USE EmployeeTracker_db;

CREATE TABLE department(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  names VARCHAR(30),
  PRIMARY KEY (id)
);

CREATE TABLE roles(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  fakesalary INTEGER(11),
  title VARCHAR(30),
  salary Decimal(5,2),
  department_id INTEGER(30),
  PRIMARY KEY (id),
  FOREIGN KEY (fakesalary) REFERENCES department(id)
);

CREATE TABLE employee(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  role_id INTEGER(30),
  last_name VARCHAR(30),
  first_name VARCHAR(30),
  manager_id INTEGER(11),
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);
INSERT INTO department (names) values ('Jane');
INSERT INTO department (names) values ('Mark');
INSERT INTO department (names) values ('Lewis');
INSERT INTO department (names) values ('Andre');

INSERT INTO roles (title, fakesalary, department_id, salary) values ('Pride and Prejudice', 1, 9, 44.44);
INSERT INTO roles (title, fakesalary, department_id, salary) values ('Emma', 1, 8, 44.44);
INSERT INTO roles (title, fakesalary, department_id, salary) values ('The Adventures of Tom Sawyer', 2, 8, 44.44);
INSERT INTO roles (title, fakesalary, department_id, salary) values ('Adventures of Huckleberry Finn', 2, 7, 44.44);
INSERT INTO roles (title, fakesalary, department_id, salary) values ('Alice''s Adventures in Wonderland', 3, 6, 44.44);
INSERT INTO roles (title, fakesalary, department_id, salary) values ('Dracula', null);


INSERT INTO employee (last_name, role_id, first_name, manager_id) values ('Great book !', 2, "bill", 12);
INSERT INTO employee (last_name, role_id, first_name, manager_id) values ('Amazing', 3, "Tim", 11);

-- SELECT * FROM department;
-- SELECT * FROM roles;
-- SELECT * FROM employee;

SELECT names, title, salary, department_id
FROM roles
INNER JOIN department ON roles.fakesalary = roles.id
INNER JOIN employee ON roles.id = employee.Id
;



-- show ALL roles with department
-- INNER JOIN will only return all matching values from both tables
-- SELECT title, last_name, names, 
-- FROM books
-- left JOIN employee ON books.fakesalary = department.id;
-- -- SELECT * FROM department;
-- SELECT * FROM books;

-- show ALL books with authors
-- INNER JOIN will only return all matching values from both tables
-- SELECT title, names, , body
-- FROM books
-- INNER JOIN authors ON books.authorId = authors.id
-- INNER JOIN employee ON books.id = notes.role_id
-- ;

-- -- show ALL books, even if we don't know the author
-- -- LEFT JOIN returns all of the values from the left table, and the matching ones from the right table
-- SELECT title, firstName, lastName
-- FROM authors LEFT JOIN books 
-- ON books.authorId = authors.id;

-- -- show ALL books, even if we don't know the author
-- -- RIGHT JOIN returns all of the values from the right table, and the matching ones from the left table
-- SELECT title, firstName, lastName
-- FROM books
-- RIGHT JOIN authors ON books.authorId = authors.id;

-- /*
--   1) Create notes table
--     a) Auto increment id
--     b) body column
--     c) booksId column
--     d) primary key
--     e) foreign key
--   2) Insert data into the notes table
--   3) Perform a sql join on books with notes
--   4) BONUS: Look up how to perform a sql join on 3 tables.
-- */