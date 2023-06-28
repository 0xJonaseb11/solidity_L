//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    string public value = 'My contract value';
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;  //Unsigned int
    uint8 public myUint8 = 100;

    enum State { Waiting, Ready, Active }
    State public state;




    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }

    function getContract() public view returns (string memory, bool, int, uint, uint8, State) {
        return (
            value,
            myBool,
            myInt,
            myUint,
            myUint8,
            state
        );
    }

    function setContract(string memory _value, bool _myBool, int _myInt, uint _myUint, uint8 _myUint8) public {
        value = _value;
        myBool = _myBool;
        myInt = _myInt;
        myUint = _myUint;
        myUint8 = _myUint8;
    }

    //With structs
// Person[] public people; alternative to use of mapping as below

uint256 public peopleCount = 0;
mapping (uint => Person) public people;

struct Person {
    string _firstName;
    string _lastName;
    uint id; 
}

function addPerson(string memory _firstName, string memory _lastName) public {
    peopleCount += 1;
    people[peopleCount] = Person(_firstName, _lastName, peopleCount);
    //  people.push(Person(_firstName, _lastName)); //same as above
  }
}
