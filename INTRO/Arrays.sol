//ARRAYS


// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    uint[] public arr1 = [1, 2, 3];
    uint[] public arr2;
    uint[10] public arr3;
    string[] public arr4 = ['apple', 'banana', 'carrot'];
    string[] public arr5;
    string[10] public arr6;

}

contract MyContract {
    uint[] public array;

    function get( uint i) public view returns ( uint ) {
        return array[i];
    }
    function length() public view returns ( uint ) {
        return array.length;
    } 
    function push( uint i ) public {
        array.push(i);
    }
    function pop() public {
        return array.pop(i);
    }
    function remove( uint index ) public {
        delete array[index];
    }
}