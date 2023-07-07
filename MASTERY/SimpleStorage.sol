 // SPDX-Licence-Identifier: UNLICENCED
pragma solidity ^0.8.18;


contract SimpleStorage {
     uint256 public userFavoriteNumber; //when not assigned a value, it is initialised to zero
    
    struct Person {
        uint256 favoriteNumber;
        string name;
         
    }

    Person[] public bigBros;

    Person public Jonas = Person({favoriteNumber: 10, name: 'Jonas'});
    Person public Baddex = Person({favoriteNumber: 23, name: 'Baddext'});
    Person public Noel = Person({favoriteNumber: 21, name: 'Noel'});

    function store( uint256 _favoriteNumber ) public {
        userFavoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns( uint256 ) {
        return userFavoriteNumber;
    }

    function addPerson( string memory _name, uint256 _favoriteNumber) public {
        bigBros.push(Person(_favoriteNumber, _name));
    }

}




// //=====================================================
// //Datatypes
// /** boolean:true, false
//     uint:Positive whole number:No decimal used
//     int: signed whole number
//     address, bytes e.t.c
//     uint256:The number 256 is the number of bits  
//     */
// //=====================================================
