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
    function increment( uint a, uint b ) external pure returns {
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
        a **= 2; // 16
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