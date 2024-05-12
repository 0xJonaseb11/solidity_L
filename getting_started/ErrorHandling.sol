//ERROR HANDLING

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    event Log( string message);

    function example1( uint _value ) public {
        require(_value > 10, "Must be greater than 10");
        emit Log("success");
    }

    function example2( uint _value ) public {
        if(_value <= 10 ) {
            revert("Must be greater than 10");
        }
        emit Log("Success");
    } 
}

contract Ownable {
    address owner;
    
    constructor() {
        owner = msg.sender;   
    }
    modifier onlyOwner {
        require (msg.sender == owner, "Caller must be owner");
        _;    
    }
}


contract MyContract is Ownable {
    string public name = 'example1';

    function setContractName( string memory _name) public onlyOwner {
        name = _name;

    }
}
