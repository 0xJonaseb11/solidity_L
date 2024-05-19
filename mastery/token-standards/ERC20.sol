// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    constructor() ERC20("cookie", "cke") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function mint(uint _qty) public {
        _mint(msg.sender, _qty);
    }

    // burn tokens
    function burn(uint _qty) public {
        _burn(msg.sender, _qty);
    }

    
}