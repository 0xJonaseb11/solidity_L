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