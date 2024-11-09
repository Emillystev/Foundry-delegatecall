// SPDX-License-Identifier: MIT

// https://solidity-by-example.org/delegatecall

pragma solidity ^0.8.19;

// NOTE: Deploy this contract first
contract Contract1 {
    // NOTE: storage layout must be the same as contract Contract2

    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars1(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

    function getNum() public view returns (uint256) {
        return num;
    }

    function getSender() public view returns (address) {
        return sender;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}
