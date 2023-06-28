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