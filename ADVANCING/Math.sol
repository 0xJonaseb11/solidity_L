   pragma solidity  ^o.8.0;
   
     contract MyContract {
        uint256 public value;
        
   function calculate( uint _value1, uint _value2 ) public {
        value = _value1 / _value2;
        Math.divide( _value1, _value2); //does ilike the above




}   
 }