// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DailyLogin} from "../src/DailyLogin.sol";

contract DeployDailyLogin is Script {
    function run() external returns (DailyLogin) {
        vm.startBroadcast();
        DailyLogin dailyLogin = new DailyLogin();
        vm.stopBroadcast();
        return dailyLogin;
    }
}
