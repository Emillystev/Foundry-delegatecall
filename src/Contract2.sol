// SPDX-License-Identifier: MIT

// https://solidity-by-example.org/delegatecall

pragma solidity ^0.8.19;

contract Contract2 {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars2(address _contract, uint256 _num) public payable {
        // Contract2's storage is set, Contract1 is not modified.
        // (bool success, bytes memory data) = _contract.delegatecall

        (bool success,) = _contract.delegatecall(abi.encodeWithSignature("setVars1(uint256)", _num));
        if (!success) {
            revert("delegatecall failed");
        }
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
