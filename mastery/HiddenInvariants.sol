// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleToken {
    
    // state variables
    string public name;
    string public symbol;
    uint public totalSupply;

    mapping(address => uint) public balances;

    constructor(string memory _name, string memory _symbol, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient funds");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}