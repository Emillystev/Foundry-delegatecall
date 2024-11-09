// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Contract1} from "../src/Contract1.sol";
import {Contract2} from "../src/Contract2.sol";

contract DeployContracts is Script {
    function run() public returns (Contract1, Contract2) {
        vm.startBroadcast();
        Contract1 contract1 = new Contract1();
        Contract2 contract2 = new Contract2();
        vm.stopBroadcast();
        return (contract1, contract2);
    }
}

