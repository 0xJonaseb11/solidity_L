//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//INHERITANCE

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function store(uint256 _newNumber) public /**override**/ {
        userFavoriteNumber = _newNumber + 5;
    }
}
