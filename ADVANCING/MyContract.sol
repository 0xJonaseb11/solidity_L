//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
 
 contract MyContract {
    string value;

    constructor() public {
        value = 'MyValue';
    }
    function getContract() public view returns (string) {
        return value;
    }
    function setContract( string _value) public {
        value = _value;
    }
 }
 