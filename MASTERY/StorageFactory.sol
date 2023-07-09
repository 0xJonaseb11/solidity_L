//SPDX-License-Identifier: MIT
pragma solidity >=0.5.15 <0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol"; //advanced

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;
    SimpleStorage[] public listOfSimpleStorageAddresses;

    //interacting with contract abi
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function storageFactoryStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
            _simpleStorageIndex
        ];
        mySimpleStorage.store(_newSimpleStorageNumber);
        // SimpleStorage mySimpleStorage = SimpleStorage(listOfSimpleStorageAddresses[_simpleStorageIndex]); //returns address

        //short alternative to above approach
        listOfSimpleStorageContracts[_simpleStorageIndex].store(
            _newSimpleStorageNumber
        );
    }

    function storageFactoryGet(
        uint256 _simpleStorageIndex
    ) public view returns (uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
            _simpleStorageIndex
        ];
        return mySimpleStorage.retrieve();
        //Short alternative to above approach
        //return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
