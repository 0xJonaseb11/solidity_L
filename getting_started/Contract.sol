// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    string name = 'Example 1';

//functions 
    function setContractName (string memory contractName)  public {
        name = contractName;
    }

    function getContractName () public view returns ( string memory){
        return name;
    }

    function resetContractName () public {
        name = 'Example 2';
    }
    // if i make this internal, it will be visible inside this contract only
    //ie;
    function resetContractName_1() internal {
        name = "Example 3";
    }

}

//Other illustrations of different contracts
contract OurContract {
    string name1 = 'Name 1';
    string private name2 = 'Name 2';
    string internal name3 = 'Name 3';
    string public name4 = 'Name 4';  

}

//Another contract with different datatypes

contract Contract99 {
    uint public count;

    function increment1 () public {
        count = count + 1;

    }
    function increment2 () public {
        increment1();
    }
    function increment3 () private {
        count = count + 1;
    }
    function increment4 () public {
        increment3();
    }
    function increment5 () external {
        count = count + 1;
    }
    function increment6 () internal {
        count  = count + 1;
    }
    function increment7 () public {
        increment6();
    }
}

// EXPLANATION 
/**
-------------------------
A private cfunction can be called inside another function
but inside the same contract..
it cannot be called inside another contract
----------------------------
A public function can be called every where in 
your file since it is called public
--------------------------
An external function can only be accessed outside the contract declared into
when tried to be called inside that contract, it isnot possible
---------------------------
An internal function is called inside that contract declared into , meaning that only can be accessed inside that same contract
---------------------------

 */


//MODIFIERS
contract MyContract { 
    string public name = 'Example 5';
    uint public balance;

    function getContractName () public view returns ( string memory ) {
        return name;
    }
    function add ( uint a, uint b ) public pure returns ( uint ) { // do not modify the state
        return a + b;
    }
    function  pay () public payable {  //allows us to receive ether
         
        balance = msg.value;
   }
}

//CUSTOM MODIFIERS

contract MyContract {
    address private owner;
    string public name = "";

    modifier onlyOwner {
        require (msg.sender == owner, 'Caller must be Owner');
    }
    function setContractName ( string memory contractName) onlyOwner public {
        name = contractName;
    }
}

//CONSTRUCTORS
//works like other functions  except it can be called once
contract  MyContract {
    string public name;

    constructor ( string memory contractName ) {
        name = contractName;

    }
}

//GLOBAL VARIABLES

contract MyContract {
    address public contractAddress;
    address public payer;
    address public origin;
    uint amount;

    constructor () {
        contractAddress = address(this);
    }

    function pay () public payable {
        payer = msg.sender;
        origin = tx.origin;
        amount = msg.value;
    } 

    function getBlockInfo () public view returns ( uint, uint, uint ) {
        return (
            block.number,
            block.timestamp,
            block.chainid
        );

    }
}

//OPERATORS
contract MyContract {
    function add( uint a, uint b) external pure returns ( uint ) {
        return a + b;
    }
    function subtract( uint a, uint b ) external pure returns ( uint ) {
        return a - b;
    }
    function multiply( uint a, uint b) external pure returns ( uint ) {
        return a * b;
    }
    function divide( uint a, uint b) external pure returns ( uint ) {
        return a / b;
    }
    function exponent( uint a, uint b ) external pure returns ( uint ) {
        return a ** b;
    }
    function modulus( uint a, uint b ) external pure returns ( uint ) {
        return a % b;
    }
    function increment( uint a, uint b ) external pure returns ( uint ){
        a++;
        return a;
    }
    function decrement( uint a, uint b ) external pure returns ( uint ) {
        a--;
        return a;
    }
    function equal( uint a, uint b ) external pure returns ( bool ) {
        return a == b;
    }
    function notEqual( uint a, uint b ) external pure returns ( bool ) {
        return a != b;
    }
    function greater( uint a, uint b ) external pure returns ( bool ) {
        return a > b;
    }
    function less( uint a, uint b ) external pure returns ( bool ) {
        return a < b;
    }
    function lessOrEqual( uint a, uint b ) external pure returns ( bool ) {
        return a <= b;
    }
    function greaterOrEqual( uint a, uint b ) external pure returns ( bool ) {
        return a >= b;
    }


    function mathExample() external pure returns ( uint ) {
        uint a;
        a += 1; // 1
        a++; // 2
        a *= 2; // 4
        a ** a = 2; // 16
        a /= 2; // 8
        a -= -1; // 7
        a --; // 6

        return a;
    }

// Example with a non-integer comparison

function checkAddress() external pure returns ( bool ) {
    address address1 = '0xcfdEf8165d722DC56a1FD06923de261B5B9d8626';
    address address2 = '0x1F334285EfdbE58034d3F24DD0703672E0741f00';
    return ( address1 == address2 );
    } 
}

//CONDITIONALS
contract MyContract {
    function evenOrOdd1( uint x ) public pure returns ( string memory ) {
        if ( x % 2 == 0 ) {
            return "Even";
        } else {
            return "Odd";
        }
    }
    function evenOrOdd2( uint x ) public pure returns ( string memory ) {
        if ( x % 2 == 0 ) {
            return "Even";
        }
        return "Odd";
    }
    function evenOrOdd3( uint x ) public pure returns ( string memory ) {
        return x % 2 == 0 ? "Even" : "Odd";

    }
}

//ARRAYS
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

//MAPPINGS

contract MyContract {
    mapping( uint => string ) public names;
    mapping( uint => address ) public addresses;
    mapping( address => uint ) public balances;
    mapping( address => bool ) public hasVoted;
    mapping( address => mapping( uint => bool )) public myMapping;

}

contract myMapping {
    mapping( uint => string ) public myMapping;

    function get( uint id ) public view returns ( string memory) {
        return myMapping[id];
    }
    function set( uint i, string memory value ) public {
        myMapping[id] = value;
    }
    function remove( uint id ) public {
        //Resets the value to the defaul value
        delete myMapping[id];
    }
}

//STRUCTS
contract MyContract {
struct Book {
    string title;
    string author;
    bool completed;
}
//Array of books
Book[] public books;

function add( string memory title, string memory author ) public {
    books.push(Book( title, author, false));
}
function get( uint index ) public views returns (
     string memory title, string memory author, bool completed) {
        Book storage book = books[index];
        return (book.title, book.author, book,completed);

   }
   //Update completed
   function completed( uint index) public {
    Book storage book = books[index];
    book.completed = true;
   }
}

//EVENTS
contract MyContract {
    string public message = 'Over.. There';

    event MessageUpdated (
        address indexed user,
        string _message

    );
    function updateMessage ( string memory _message ) public {
        message = _message;
        emit MessageUpdated( msg.sender, _message);
     }
}
 
 //ACTIONS AFTER IMPLEMENTATION OF SMART CONTRACTS
contract MyContract {
    //To receive ether directly to a smart contract
    receive() external payable {
        //additional info
    }
    //checking for a specific message or keyword for a transaction
        uint public count = 0;
    fallback() external payable{
        count++;
    }
    //Checking the balance on an account
    function checkBalande() public view returns ( uint ) {
        return address(this).balance;
    }
    //Sending ether to a different address of account
    function transfer( address payable _to) public payable {
        ( bool sent, ) = _to.call{ value: msg.value}("");
        require(sent, "Failed");
    }

}

//ERROR HANDLING
contract MyContract {
    event Log( string message);

    function example1( uint _value ) public {
        require(_value > 10, "Must be greater than 10");
        emit Log("success");
    }

    function example2( uint _value ) public {
        if(_value <= 10 ) {
            revert("Must be greater than 10");
        }
        emit Log("Success");
    } 
}

contract Ownable {
    address owner;
    
    constructor() {
        owner = msg.sender;   
    }
    modifier onlyOwner {
        require (msg.sender == owner, "Caller must be owner");
        _;    
    }
}


contract MyContract is Ownable {
    string public name = 'example1';

    function setContractName( string memory _name) public onlyOwner {
        name = _name;

    }
}

//CALLING OTHER CONTRACTS
 contract SecretVault {
    string private secret;

    constructor ( string memory _secret) {
        secret = _secret;
      }
      function setSecret( string memory _secret ) external {
        return _secret;

      } 
      function getSecret() external view returns ( string memory ) {
        return secret;
      }
   }

   contract MyContract {
    SecretVault public secretVault;

    constructor( SecretVault _secretVault) {
        secretVault = _secretVault;
    }
    function setSecret( string memory _secret) public {
        secretVault.setSecret(_secret);
    }
    function getSecret() public view returns ( string memory ) {
        return secretVault.getSecret();
      }
   }

   //INTERFACES
   
   interface IERC20 {
    function transferForm(
        address _from,
        address _to,
        uint256 _value
    ) external returns ( bool success );
   }

   contract MyContract {
    function deposit( address _tokenAddress, uint _amount ) public {
        IERC20( _tokenAddress ).transfer( msg.sender, address(this), _amount );
     }
   }