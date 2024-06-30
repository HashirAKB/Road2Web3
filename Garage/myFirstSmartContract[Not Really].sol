// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //solidity version

contract SimpleStorage {

    // Basic Variable Types: boolean, unit, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint256 favouriteNumber = 88;
    // int256 favouriteNumberTwo = -34;
    // string name = "hashir";
    // address myAddress = 0x031370059ca3d89c9677f5c8537baeC1693fDF17;
    // bytes32 favouriteBytes32 = "cat";
    // All the types in solidity have a default value.
    // uint256 favouriteNumber; // Will initialize to zero if no value is given. Here the visibility is set to internal by default.
    uint256 public favouriteNumber; //Need to explicitly set public for public visibility.

    //Function in solidity
    // A function which'll be updating the favouriteNumber
    function store(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
        // uint256 testVar = 222; //Only scoped inside the function.   
    }

    function something() public {
        // testVar = 434; //Won't work.
        favouriteNumber = 7; //Will work.
    }

    // Fn deployed at address: 0xd9145CCE52D386f254917e481eB44e9943F39138
    //Public: visible both exterally and internally. Creates a getter function.
    //Private: visible only in the current contract.
    //External: Only visible externally.
    //Internal: Only visible internally and their child contracts.

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }
    //View and Pure Keywords: View means it'll be reading state from the blockchain. But it won't allow updating blockchain state.
    //But Pure will disallow both updating and reading blockchain state.
    function retrieveWontWork() public pure returns(uint256){
        return favouriteNumber; //Shows error here.
    }

    function retrieveWillWork() public pure returns(uint256){
        return 7; //returns just a 7, not a state, so this'll work with pure.
    }
}

