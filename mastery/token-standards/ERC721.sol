// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NonFungible is ERC721 {
    
    constructor () ERC721("Jonas", "JAZ") {

    }

    // do safeMint token
    function safeMint(address to, uint256 tokenID) public {
        _safeMint(to, tokenID);


    }
}