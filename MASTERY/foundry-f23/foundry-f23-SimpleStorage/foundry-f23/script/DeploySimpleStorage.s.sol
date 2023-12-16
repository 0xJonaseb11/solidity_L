//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import  { Script } from '../lib/forge-std/src/Script.sol';
import { SimpleStorage } from '../src/SimpleStorage.sol';

contract DeploySimpleStorage is Script {

    function run () external returns( SimpleStorage ) {
        vm.startBroadcast(); //everything after this vm, is sent to the device rpc
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast(); //stop sending to device rpc
        
        return simpleStorage;
    }


}