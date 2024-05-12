//CONSTRUCTORS


// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//works like other functions  except it can be called once
contract  MyContract {
    string public name;

    constructor ( string memory contractName ) {
        name = contractName;

    }
}
