// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {Contract2} from "../src/Contract2.sol";
import {Contract1} from "../src/Contract1.sol";

contract Interactions is Script {
    function run() public {
        address mostRecentlyDeployed1 = DevOpsTools.get_most_recent_deployment("Contract1", block.chainid);
        address mostRecentlyDeployed2 = DevOpsTools.get_most_recent_deployment("Contract2", block.chainid);
        uint256 number;
        Contract1SetVars(mostRecentlyDeployed1, number);
        Contract2SetVars(mostRecentlyDeployed2, mostRecentlyDeployed1, number);
    }

    function Contract1SetVars(address mostRecentlyDeployed1, uint256 _num) public {
        _num = 77;
        vm.startBroadcast();
        Contract1(mostRecentlyDeployed1).setVars1(_num);
        vm.stopBroadcast();
    }

    function Contract2SetVars(address mostRecentlyDeployed2, address mostRecentlyDeployed1, uint256 _num) public {
        _num = 12;
        vm.startBroadcast();
        Contract2(mostRecentlyDeployed2).setVars2(mostRecentlyDeployed1, _num);
        vm.stopBroadcast();
    }
}
