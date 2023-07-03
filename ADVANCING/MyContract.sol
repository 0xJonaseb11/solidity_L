// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

//import "./SafeMath.sol";
//import "./Math.sol";

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) {
        name = _name;
    }

    function mint() public virtual {
        balances[tx.origin]++;
    }
}

//Inheritance
contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    constructor(string memory _name, string memory _symbol) ERC20Token(_name) {
        symbol = _symbol;
    }

    function mint() public override  {
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
}

contract MyContract {
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1; //Unsigned int
    uint8 public myUint8 = 100;
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    address public owner;
    uint256 public openingTime = 1687984697; //we use epoch time
    address public token;
    uint256 public value;

    enum State {
        Waiting,
        Ready,
        Active
    }
    State public state;

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }

    function getContract()
        public
        view
        returns (uint256, bool, int, uint, uint8, State)
    {
        return (value, myBool, myInt, myUint, myUint8, state);
    }

    function setContract(
        uint256 _value,
        bool _myBool,
        int _myInt,
        uint _myUint,
        uint8 _myUint8
    ) public {
        value = _value;
        myBool = _myBool;
        myInt = _myInt;
        myUint = _myUint;
        myUint8 = _myUint8;
    }

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
        uint256 _value;
        uint _id;
    }

    address payable wallet;

    event Purchase(address _buyer, uint _amount);

    constructor(address payable _wallet, address _token) {
        owner = msg.sender;
        wallet = _wallet;
        token = _token;
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName
        
    ) public onlyOwner onlyWhileOpen {
        incrementCount();
        people[peopleCount] = Person(_firstName, _lastName, value, peopleCount);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }

    mapping(address => uint256) public balances;

    function buyToken() public payable {
        balances[msg.sender] += 1;
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }

     fallback() external payable {
         buyToken();
     }

     receive() external payable {
         buyToken();
    }
}
