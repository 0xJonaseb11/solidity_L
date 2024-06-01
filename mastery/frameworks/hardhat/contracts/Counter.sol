//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;
 
contract Counter {
 
 uint num;
 
 function increment() public {
   num += 1;
 }
 
 function decrement() public {
   num -= 1;
 }
  function getNum() public view returns(uint) {
   return num;
 }
}