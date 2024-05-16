// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Counter {
   uint8 public variable;
 
   constructor() {
       variable = 5;
   }
   function decrement() public {
       variable--;
   }
   function increment() public {
       variable++;
   }
}