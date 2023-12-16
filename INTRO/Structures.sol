// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//STRUCTS
contract MyContract {
struct Book {
    string title;
    string author;
    bool completed;
}
//Array of books
Book[] public books;

function add( string memory title, string memory author ) public {
    books.push(Book( title, author, false));
}
function get( uint index ) public views returns (
     string memory title, string memory author, bool completed) {
        Book storage book = books[index];
        return (book.title, book.author, book,completed);

   }
   //Update completed
   function completed( uint index) public {
    Book storage book = books[index];
    book.completed = true;
   }
}