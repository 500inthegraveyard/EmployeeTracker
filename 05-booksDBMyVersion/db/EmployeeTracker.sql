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
  title VARCHAR(30),
  salary Decimal(5,2),
  department_id INTEGER(30),
  PRIMARY KEY (id),
  FOREIGN KEY (department_id) REFERENCES department(id)
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
INSERT INTO department (names) values ('Accounting');
INSERT INTO department (names) values ('Sales');
INSERT INTO department (names) values ('HR');
INSERT INTO department (names) values ('Legal');

INSERT INTO roles (title, department_id, salary) values ('Developer', 2, 44.44);
INSERT INTO roles (title, department_id, salary) values ('Lawyer', 3, 44.44);
INSERT INTO roles (title, department_id, salary) values ('stockboy', 4, 44.44);
INSERT INTO roles (title, department_id, salary) values ('receptionist', 4, 44.44);
INSERT INTO roles (title, department_id, salary) values ('Boss', 1, 44.44);
INSERT INTO roles (title, department_id, salary) values ('Stock trader', 2, 44.44);


INSERT INTO employee (last_name, role_id, first_name, manager_id) values ('Smith', 2, "bill", 2);
INSERT INTO employee (last_name, role_id, first_name, manager_id) values ('Johnson', 3, "Tim", 4);
INSERT INTO employee (last_name, role_id, first_name, manager_id) values ('longshore', 2, "Chad", 2);
INSERT INTO employee (last_name, role_id, first_name, manager_id) values ('baseball', 3, "Gary", 4);

-- SELECT * FROM department;
-- SELECT * FROM roles;
-- SELECT * FROM employee;

SELECT names, title, salary, e.first_name, e.last_name, m.last_name as manager_last_name, m.first_name as manager_first_name
FROM roles
INNER JOIN department ON roles.department_id = department.id
INNER JOIN employee e ON roles.id = e.role_id 
INNER JOIN employee m ON e.manager_id = m.id;
