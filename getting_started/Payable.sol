// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Payable {

    //state variables
    bool paid;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function payment() public payable {
        require(msg.value == 0.1 ether, "Insufficient funds!");
        paid = true;
    }

    function withdraw() public {
        require(owner == msg.sender, "Only owner can call this function");
        owner.transfer(address(this).balance);

        // Alternatively use send
        bool sent = owner.send(address(this).balance);
        require(sent, "Send failed");

        /**
        * call
        *
        *The most recommended method currently to send ether 
        *is to use the ‘call’ keyword. That’s because it’s used in 
        *combination with the re-entrancy guard to protect our smart
        *contract against the re-entrancy attack that we’ll learn in the advanced security module. 
        */

        // use call to safely 
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Send failed");
    }

    // gas fees - factors
    /**
    * Complexity of transaction (gas unit)
   * Demand for making transactions (gas price)
   * Price of Ether (to calculate dollar value) 
   */
}