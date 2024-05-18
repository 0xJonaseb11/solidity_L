// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is Ownable {

    uint num;

    constructor () {
        num = 5;
    }

    function increment() public onlyOwner {
        ++num;
    }

    function decrement() public onlyOwner {
        --num;
    }

    function getNum() public view returns(uint) {
        return num;
    }

}