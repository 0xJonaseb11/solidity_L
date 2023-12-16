//SPDX-License: UNLICENSED
pragma solidity ^0.8.0;

//CUSTOM MODIFIERS

contract MyContract {
    address private owner;
    string public name = "";

    modifier onlyOwner {
        require (msg.sender == owner, 'Caller must be Owner');
        _;
    }
    
    function setContractName ( string memory contractName) onlyOwner public {
        name = contractName;
    }
}
