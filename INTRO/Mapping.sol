//MAPPINGS
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    mapping( uint => string ) public names;
    mapping( uint => address ) public addresses;
    mapping( address => uint ) public balances;
    mapping( address => bool ) public hasVoted;
    mapping( address => mapping( uint => bool )) public myMapping;

}

contract myMapping {
    mapping( uint => string ) public myMapping;

    function get( uint id ) public view returns ( string memory) {
        return myMapping[id];
    }
    function set( uint i, string memory value ) public {
        myMapping[id] = value;
    }
    function remove( uint id ) public {
        //Resets the value to the defaul value
        delete myMapping[id];
    }
}