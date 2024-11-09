// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {Contract1} from "../src/Contract1.sol";
import {Contract2} from "../src/Contract2.sol";
import {DeployContracts} from "../script/DeployContracts.s.sol";
import {Interactions} from "../script/Interactions.s.sol";

contract ContractTest is Test {
    DeployContracts public deployContracts;
    Contract1 public contract1;
    Contract2 public contract2;
    Interactions public interactios;

    address contract1Address;
    address contract2Address;

    function setUp() external {
        deployContracts = new DeployContracts();
        interactios = new Interactions();
        (contract1, contract2) = deployContracts.run();
    }

    function testNumChangesAfterDelegatecall() public {
        deployContracts.run();
        (contract1, contract2) = deployContracts.run();
        uint256 expectedValue = 10;
        contract2.setVars2(address(contract1), expectedValue);
        assert(expectedValue == contract2.getNum());
    }
}
