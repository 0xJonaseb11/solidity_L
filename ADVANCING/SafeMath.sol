//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
//code to be gotten from zepplin.com
library SafeMath {
       
            //Multiplication
    function mul( uint256 a, uint256 b) internal pure returns ( uint256 ) {
        if ( a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require( c / a == b);
        return 0;
    }
            //Division
    function div( uint256 a, uint256 b) internal pure returns ( uint256 ) {
         require( b > 0);  //THis handles any case
         uint256 c = a / b;
         return c;

    }
           //Subtraction
    function sub( uint256 a, uint256 b) internal pure returns ( uint256 ) {
        require( b <= a);
        uint256 c = a - b;
        return c;

    }
           //Addition
    function add( uint256 a, uint256 b) internal pure returns ( uint256 ) {
        uint256 c = a + b;
        require( c >= a);
        return c;
    }
           //Modulus
    function mod( uint256 a, uint256 b) internal pure returns ( uint256 ) {
        uint256 c = a % b;
        require( b != 0);
        return c;
    }
}

