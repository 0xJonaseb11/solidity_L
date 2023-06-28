//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

  contract MyContract {
    //With structs
    Person[] public people;
    struct Person {
        string _firstName;
        string _lastName;
}
function addPerson( string memory _firstName, string memory _lastName ) public {
    people.push(Person(_firstName, _lastName));
}
 
}
