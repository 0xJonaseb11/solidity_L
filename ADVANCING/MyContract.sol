// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;


import  "./Math.sol";
import "./SafeMath.sol";

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor (string memory _name ) {
        name = _name;

    }

    function mint () public {
        balances[tx.origin] ++;

    }
}
//Inheritance of a token
contract MyToken is ERC20Token {
    
    string public symbol;
    address public owners;
    uint256 ownerCount;

    constructor ( string memory _name, string memory _symbol ) ERC20Token(_name) {
        _symbol = _symbol;
    }
    function mint() public {
        super.mint();
        ownerCount ++;
     
        owner.push( msg.sender );
    }

}


contract MyContract {
    string public value = 'My contract value';
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;  //Unsigned int
    uint8 public myUint8 = 100;
    uint256 public peopleCount = 0;
    mapping (uint => Person) public people;
    address owner;
    uint256 openingTime = 1687984697; //we use epoch time
    address public token;
    uint256 public value;


    enum State { Waiting, Ready, Active }
    State public state;
    
    using SafeMath for uint256;

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }

    function getContract() public view returns (string memory, bool, int, uint, uint8, State) {
        return (
            value,
            myBool,
            myInt,
            myUint,
            myUint8,
            state
        );
    }

    function setContract(string memory _value, bool _myBool, int _myInt, uint _myUint, uint8 _myUint8) public {
        value = _value;
        myBool = _myBool;
        myInt = _myInt;
        myUint = _myUint;
        myUint8 = _myUint8;
    }

    //With structs

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Person {
        string _firstName;
        string _lastName;
        uint _id;
    }

    // setting the owner and wallet
    constructor(address payable _wallet, address _token) {
        owner = msg.sender;
        wallet = _wallet;
        token = _token;
    }

    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner onlyWhileOpen {
        incrementCount();
        people[peopleCount] = Person(_firstName, _lastName, peopleCount);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }

    // Sending ether and tokens across wallets
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchase (
        address _buyer,
        uint _amount
    );

    function buyToken() public payable {
        // Buy token
        balances[msg.sender] += 1;
         //getting token from the ERC20 contract
        ERC20Token _token = ERC20Token(address(token)); //.mint();
        _token.mint(); //remove
        // Send ether
        wallet.transfer(msg.value);
        //Trigger event Purchase
        emit Purchase( msg.sender, 1);
       
    }

    // Creating a fallback function
    fallback() external payable {
        // Handle all function calls and plain Ether transactions
        buyToken();
    }

    receive() external payable {
        // Handle plain Ether transactions
        buyToken();
    }

    //Libraries in solidity
    library Math {
        function divide( uint256 a, uint256 b) internal pure returns ( uint256 ) {
            require( b > 0); // to avoid erros
            uint256 c = a / b;
            return c;
            
        }
    }
    function calculate( uint _value1, uint _value2 ) public {
        value = _value1 / _value2;
        Math.divide( _value1, _value2); //does ilike the above
        value = SafeMath.divide( _value1, _value2);
            //or
        value = _value1.div(_value2);    

    }
}

a