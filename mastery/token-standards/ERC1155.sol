// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { ERC1155 } from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract MyCollection is ERC1155, Ownable {
    
    constructor () ERC1155("") {}

    function setURI(string memory newURI) public onlyOwner {
        _setURI(newURI);
    }

    function mint(uint256 id, uint256 amount, bytes memory data) public {
        _mint(msg.sender, id, amount, data);
    }

}