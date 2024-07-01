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

       //01.07.2024
    //Arrays and Structs in solidity.
    uint256[] listOfFavouriteNumbers; //[0, 1, 22, 2343] Declaring lists/arrays
    struct Person{
        uint256 favouriteNumber; //at Index 0
        string name;//at index 1
    } //Declared a structure
    // Person public Om = Person({favouriteNumber:5, name:"Omkar Shankar"});
    // Person public Ram = Person({favouriteNumber:8, name:"Ram Pavan"});

    //Lets create an array of persons. This is a dynamic array
    Person[] public listOfPeople; //[]
    Person[2] public parents; //Static array, only two items. Any size upto 2.

    //lets create a fn to add people/update the listOfPeople array:
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
    }

    //Memory Keyword/Storage and call data.
    //EVM can read & write to: Stack,Memory,Storage,Transient Storage, CallData, Code, and Returndata.
    //EVM write only: logs.
    //EVM read only: Txn data and blobHash, Chain Data, Gas Data, Program Counter

    //CallData, Memory, and Storage.
    //Calldata and memory is only gonna exist during function call. Exists for a very short period of time for the single cal.

    // function addPerson(string memory _name, uint256 _favouriteNumber) public {
    //     // _name = "Rat"; //Will work with memory but not with calldata.
    //     listOfPeople.push(Person(_favouriteNumber, _name));
    // }
    //The diff bw memory and calldata is that they both are temporary variables but memory can be modified and calldata can't.
    //Storage is a permanent variable that can be modified.

    //Basic Solidity Mapping
     mapping(string => uint256) public nameToFavouriteNumber; //in a mappig the default value for all the keys will be 0.
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        // _name = "Rat"; //Will work with memory but not with calldata.
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    //Contract Deployed - Address: 0x017fEaE56a36e9F8335525995e7A478171102514
    //Deployed a contract to sepolia eth test network.
    https://sepolia.etherscan.io/address/0x017fEaE56a36e9F8335525995e7A478171102514
    //Deployed the contract to L2 zksync sepolia test net via zksync atlas - Address: 0x8bFFC62FdfFB9540Dc3dEA3b2AC22FEE9dE920fA
    https://sepolia.explorer.zksync.io/address/0x8bFFC62FdfFB9540Dc3dEA3b2AC22FEE9dE920fA
}

