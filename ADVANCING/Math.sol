   //SPDX-License-Identifier: UNLICENSED
   pragma solidity  >=0.4.22 <0.9.0;

   import "./SafeMath.sol";
   
   library Math {
      function divide ( uint256 a, uint256 b) internal pure returns ( uint256 ) {
         require( b > 0); 
         uint256 c = a / b;
         return c;
      }

   }
   