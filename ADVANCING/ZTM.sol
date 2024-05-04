// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ZTM {

    address public myAddr = "0xba57bF26549F2Be7F69EC91E6a9db6Ce1e375390";
    uint256 public balance;

    // Mappings
    mapping(keyType => valueType) public myMappingName;
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) private _approvals;
    
    Set value: balances[myAddr] = 42;
    Read value: balances[myAddr];


    // Structs
    struct Deposit {
        address depositor;
        uint256 amount;
    }

    Deposit memory deposit;
    Deposit public deposit;
    deposit = Deposit({depositor: msg.sender, amount: msg.value});
    deposit2 = Deposit(0xba57bF26549F2Be7F69EC91E6a9db6Ce1e375390, 200);

    // Enums
    enum Colors {
        Red,
        Blue,
        Green
    };
    Color color = Colors.Red;

    // Arrays
    uint8[] public myStateArray;
    uint8[] public myStateArray = [1,2,3];
    uint8[] public myStateArray = [1,2,3];
    int8[] memory myMemoryArray = new uint8[](3);
    uint8[3] memory myMemoryArray = [1,2,3];

    myStateArray.length;
    myMemoryArray.length;

    /// For only dynamic arrays
    myStateArray.push(3);
    myStateArray.pop();

    // functions
    function functionName([arg1, arg2...]) [public|external|internal|private] 
    [view|pure] [payable] [modifier1, modifier2, ...] [returns([arg1, arg2, ...])] { … }

    function setBalance(uint256 newBalance) external {}
    function getBalance() external view returns(uint256) {}
    function _helperFunction() private returns(myNumber) {}

    // function Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can access this);
        _;
    }

    function changeOwner(address newOwner) external onlyOwner {
        owner = newOwner;

    }

    /// Fallback functions
    // Executed when called with empty data, must be external and payable
    receive() external payable {}

    // Executed when no no other function matches, must be external, can be payable
    fallback() external {}

    // Contracts
    
    constructor(uint256 initialBalance) {
        balance = initialBalance;
    }

    function setBalance(uint256 newBalance) external {
        balance = newBalance;
    }

    // We can create instances from our contracts
    ZTM ztm = new ZTM(100);
    ZTM ztm2 = new ZTM(0xba57bF26549F2Be7F69EC91E6a9db6Ce1e375390);
    //  this: current contract
    // addres(this): current contract address


    function transfer() public {
        myAddr.balance;
    
    // It's generally better to use call and handle reentrancy issues separately
        (bool success, ) = myAddr.call{value: 1 ether}("");
        require(success, "Transfer failed");
    }
}

// Inheritance

contract MyAncestorContract2 {

    function myFunction() external virtual {};

}

contract MyAncestorContract1 is MyAncestorContract2 {
    function myFunction() external virtual override {};
}

contract MyContract is MyAncestorContract1 {
    function myFunction() external override(MyAncestorContract1, MyAncestorContract2) {}

}

// Call first ancestor function
super.myFunction();
// Call specific ancestor function
MyAncestorContract1.myFunction();
MyAncestot