//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//contract that'll be used as the input.
// contract SimpleStorage{
//     uint256 favouriteNumber;

//     struct Person{
//         uint favouriteNumber;
//         string name;
//     }

//     Person[] public listOfPeople;

//     mapping(string => uint256) nameToFavouriteNumber;

//     function store(uint256 _favouriteNumber)public virtual{
//         favouriteNumber = _favouriteNumber;
//     }

//     function retrieve() public view returns(uint256){
//         return favouriteNumber;
//     }

//     function addPerson(uint256 _favouriteNumber, string memory _name) public {
//         listOfPeople.push(Person(_favouriteNumber, _name));
//         nameToFavouriteNumber[_name] = _favouriteNumber;
//     }

// }

//Instead of writng the contract, we can import it just by:
import { SimpleStorage } from "./SimpleStorage.sol";

//StorageFactory deploys the given SimpleStorage contract.
//Basically what happens here, we're deploying a contract from another contract
// contract StorageFactory{
//     //type visibility name
//     SimpleStorage public simpleStorage;
//     function createSimpleStorageContract() public {
//         simpleStorage = new SimpleStorage();
//     }
// }

//This simpleStorage variable can only store single address. To keep track of all the deployed contracts addresses:
contract StorageFactory{
    //List of all the deployed contract addrses.
    SimpleStorage[] public listOfContractAddresses;

    function createSimpleStorageContract() public{
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfContractAddresses.push(newSimpleStorageContract);
    }

    function SFactoryAccessingSStoreFn(uint256 _indexOfDepolyedSstorageContract, uint256 _favouriteNumber) public {
    SimpleStorage DeployedContractAddr = listOfContractAddresses[_indexOfDepolyedSstorageContract];
    DeployedContractAddr.store(_favouriteNumber);
    }

    function SFactoryReturnsSStoreFn(uint256 _indexOfDepolyedSstorageContract) public view returns(uint256){
        SimpleStorage DeployedContractAddr = listOfContractAddresses[_indexOfDepolyedSstorageContract];
        return DeployedContractAddr.retrieve();
    }
}

