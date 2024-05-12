// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Example {
    uint256 public  variable;
    string public message;
    bytes1 a = 0x12;
    bytes2 b = 0x1224;
    uint[] numArray = [1,2,3,4,5];




    function decrement() public  {
        unchecked {
            variable--;
        }
    }

    function increment() public  {
       unchecked {
        variable++;
       } 
    }

    function setMessage(string calldata _message) public  {
        message = _message;
    }

    function getMessage() public  view  returns (string memory) {
        return  message;
    }

    function getMessageLength() public  view  returns (uint) {
        return bytes(message).length;
    }

    function checkEqual(address acc1, address acc2) public  pure  returns (bool) {
        return  (acc1 == acc2);
    }

    // get balance of any addrss
    /*
    For further learning, there are two ways we can declare any address:
    checksum, non-checksum. In a non-checksum address, all the alphabets 
    are in lower case. However, a checksum address also includes capital letters. 
    A checksum address is used for validity. You can follow with this concept by 
    the link below in Additional Resources.
    */

    function getBalance(address _account) public  view  returns (uint256) {
        return _account.balance;
    }

    // bytes
    function compare() public  view returns (bool) {
        return  b > a;
    }

    function bitOperations() public  view  returns (bytes2) {
        return  a & b;
    }

    function leftShift() public  view  returns (bytes1) {
        return  a << 1;
    }

    function returnAtIndex(uint _index) public  view  returns (bytes1) {
        return b[_index];
    }

    function returnLength() public  view returns (uint) {
        return a.length;
    }

    // Dynamic sized byte array
    bytes a_ = "Hello";
    function getLength() public  view  returns (uint) {
        return  a.length;
    }

    // Note that type conversion between bytes and strings should be
    // explicit - can't be implicit ofc

    /*
    With implicit conversion, you need not worry about the possibility of information loss.
    The compiler will decline to compile and report an error if some data is genuinely lost.
    When using explicit conversion, you must always be mindful that some information may be lost.
     This is because the compiler will permit you to compile & will also permit the (possible) loss 
     of information, due to you wanting it explicitly.
    */

    // Arrays

    function arrayLength() public view returns(uint) {
        return numArray.length;
    }

    function getElementByIndex(uint i) public view returns(uint) {
        return numArray[i];
    }

    function pushArrray(uint n) public {
        numArray.push(n);
    }

    function popValue() public {
        numArray.pop();
    }

    // Structs
    struct Student {
        string name;
        uint roll_num;
        bool qualified;
    }

    Student public student;
    Student[] public students;

    function addStudent(string calldata _name, uint rollNum, bool _qualified) public {
        students.push(Student(_name, rollNum, _qualified));
    }

    // Alternatively, er can add a student as follows
    function pushStudent(string calldata __name, uint _roll_num, bool __qualified) public {
      
        // Student memory students; // shadows above declaration

        student.name = __name;
        student.roll_num = _roll_num;
        student.qualified = __qualified;

        students.push(student);

    }

    // Enums
    enum PlayerLevel {
        Beginner,
        Intermediate,
        Advanced
    }

    PlayerLevel public level;

    enum Status { // Values are stored as 0, 2,3 and 3 respectively
        Ordered,
        Shipped,
        Delivered,
        Cancelled
    }

    Status public status,

    function setStatus(Status _status) public {
        status = _status;
    }

    function getStatus() public view returns(Status) {
        return status;
    }






    


    




   



}