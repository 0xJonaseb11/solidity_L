// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ZTM {

    address public myAddr = "0xba57bF26549F2Be7F69EC91E6a9db6Ce1e375390";

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
    






    

    function transfer() public {
        myAddr.balance;
    
    // It's generally better to use call and handle reentrancy issues separately
        (bool success, ) = myAddr.call{value: 1 ether}("");
        require(success, "Transfer failed");





    }
}