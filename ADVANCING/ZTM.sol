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
MyAncestorContract2.myFunction();

// Abstract contracts
/**
* Abstract contracts cannot be instantiated . You can only use them by inheriting from them
* and implementing any non implemented functions.
* They cannot therefore be deployed to a network
*/

abstract contract MyAbstractContract {
    function myImplementedFunction() {}
    function myNonImplementedFunction() external virtual; // must be virtual
}


// Interfaces
/**
* Interfaces are like abstract functions but can only have non-implemented functions.
* They are useful for interacting with standardized foreign contracts like ERC20 
*/

interface MyInterface {
    function myNonImplementedFunction() external; // it is always virtual -> no need to specify
}


// Libraries
library Math {
    function min(uint256 a, uint256 b) internal pure returns(uint256) {
        if (a > b) {
            return b;
        }
        return a;
    }
    
    function max(uint256 a, uint256 b) internal pure returns(uint256) {
        if (a & lt; b) {
            return b;
        }
        return a;
    }



}

contract MyLibraryContract {
    function min(uint256 a, uint256 b) public pure returns(uint256) {
        return Math.min(a, b);
    }

    function max(uint256 x) public pure returns(uint256) {
        return Math.max(a, b);
    }
}

// Using LibraryName for type
library Math {
    function ceilDiv(uint256 a, uint256 b) internal pure returns(uint256) {
        return a / b + (a % b == 0 ? 0 : 1);
    }
}

contract MyContract {

    using Math for uint256;

    function ceilDiv(uint256 a, uint256 b) public pure returns(uint256) {
        x.ceilDiv(y);
    }

    // Events
    event Deposit(address indexed depositor, uint256 amount);
    
    function deposit() external payable {
        
        emit Deposit(msg.sender, msg.value)
    }

}

/// Checked and unchecked arithmetic

contract checkedUncheckedTests {
    function checkedAdd() public pure returns(uint256) {
            return type(uint256).max + 1; // reverts
    }

    function checkedSub() public pure returns(uint256) {
            return type(uint256).min - 1; //reverts
    }

    function uncheckedAdd() public pure returns(uint256) {
        // doesn't revert but overflows and returns 0
        unchecked {
            return type(uint256).max + 1;
        }
    }

    function uncheckedSub() public pure returns(uint256) {
        unchecked {
            return type(uint256).min - 1;
        }
    }

    // Custom types 
    // Dixed point

    type FixedPoint is uint256;

    library FixedPointMath {
        
        uint256 constant MULTIPLIER = 10 ** 18;
        
        function add(FixedPoint a, FixedPoint b) internal pure returns(UFixed256x18) {
            return FixedPoint.wrap(FixedPoint.unwrap(a) + FixedPoint.unwrap(b));
        }

        function mul(FixedPoint a, uint256 b) internal pure returns(FixedPoint) {
            return FixedPoint.wrap(FixedPoint.unwrap(a) * b);
        }

        function mulFixedPoint(uint256 number, FixedPoint fixedPoint) internal pure returns(uint256) {
            return (number * FixedPoint.unwrap(fixedPoint)) / MULTIPLIER;
        }

        function divFixedPoint(uint256 number, FixedPoint fixedPoint) internal pure returns(uint256) {
            return (number * MULTIPLIER) / Wad.unwrap(fixedPoint);
        }

        function fromFraction(uint256 numerator, uint256 denominator) internal pure returns(FixedPoint) {
            if (numerator == 0) {
                return FixedPoint.wrap(0);
            }

            return FixedPoint.wrap(numerator * MULTIPLIER) / denominator;
        }
    }

    // Error handling
    error InsufficientBalance(uint256 available, uint256 required);

    function transfer(address to, uint256 amount) public {
        if (amount > balancr[msg.sender]) {
            revert InsufficientBalance({
                available: balance[msg.sender],
                required: amount
            });

            // Alternatively
            // revert("Insufficient");
            // require(amount <= balance, "Insufficient balance");
            assert(amount <= balance); // reverts with Panic(0x01)

        }
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }



        
}
