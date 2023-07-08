//SPDX-License-Identifier: MIT
pragma solidity >=0.5.15<0.8.18;

contract Fallback {
    uint256 public result;

    receive() external payable {
        result = 1;
    }

    fallback() {
        result = 2;

    }
}