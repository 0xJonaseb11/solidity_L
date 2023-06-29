//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
 
 contract MyContract {
    string public value = 'My contract value';
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;  //Unsigned int
    uint8 public myUint8 = 10;
        
    enum State { Waiting, Ready, Active }
    State public state;
    
    function activate() public {
        state = State.Waiting;
    }
    function isActive() public view returns ( bool ) {
        return state == State.Active;
    }
     
     function getContract () public view returns ( string memory, bool, int, uint, uint8  ) {
      return (
        value,
        myBool,
        myInt,
        myUint,
        myUint8
      );

    }
    function setContract( string  memory _value) public {
        
        value = _value;
    }


 }
