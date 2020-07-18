const connection = require('./connection');

class DB {
    constructor(connection){
        this.connection = connection;
    }

    getBooks(){
        return connection.query(`SELECT names, title, salary, e.first_name, e.last_name, m.last_name as manager_last_name, m.first_name as manager_first_name
            FROM roles
            INNER JOIN department ON roles.department_id = department.id
            INNER JOIN employee e ON roles.id = e.role_id 
            INNER JOIN employee m ON e.manager_id = m.id;`)
    }

    // TODO: create addBook method that invokes an INSERT INTO statement
}

module.exports = new DB(connection)

// const test = new DB(connection);

// test.getBooks()
//     .then(response => console.log(response))