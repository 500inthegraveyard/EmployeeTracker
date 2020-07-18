const inquirer = require("inquirer");
const db = require('./db');

function getBooks(){
   return db.getBooks()
    .then(response => response)
    .catch(err => err)
}

function addBook(){
    // TODO: Inquirer prompt that asks the user for book information
    // TODO: db.addBook()
}
inquirer
    .prompt([
        {
            type: 'list',
            message: 'Choose an operation?',
            name: 'option',
            choices: ['View All Books','View all employees by department' ]
        }
    ]).then(async ({option}) => {
      switch (option) {
          case 'View All Books':
             const books = await getBooks()
             console.table(books)
            break;
            case 'View all employees by department':
            

          default:
              break;

      }
    }).catch(err => console.log(err))