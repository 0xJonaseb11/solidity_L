// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 public userFavoriteNumber; //when not assigned a value, it is initialised to zero

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    //dynamic array
    Person[] public bigBros;

    //mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    Person public Jaz = Person({favoriteNumber: 99, name: "Jaz"});
    Person public Baddext = Person({favoriteNumber: 23, name: "Baddext"});
    Person public Noel = Person({favoriteNumber: 21, name: "Noel"});

    function store(uint256 _favoriteNumber) public /**virtual**/ {
        userFavoriteNumber = _favoriteNumber; //+5
    }

    function retrieve() public view returns (uint256) {
        return userFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        bigBros.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
// Deploying a contract from another contract
//when you don't want to use import
//not a good practice
// contract StorageFactory {

//          //uint256 favoriteNumber
//         //type visibility
//         SimpleStorage public simpleStorage;
//     function createSimpleStorageContract() public {
//         simpleStorage = new SimpleStorage();

//     }
// }

// //=====================================================
// //Datatypes
// /** boolean:true, false
//     uint:Positive whole number:No decimal used
//     int: signed whole number
//     address, bytes e.t.c
//     uint256:The number 256 is the number of bits
//     */
// //=====================================================
