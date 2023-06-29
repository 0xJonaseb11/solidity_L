//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }
}
contract MyContract is Ownable {
    uint public data;

    function setData(uint _data) public onlyOwner {
        data = _data;
    }
}
