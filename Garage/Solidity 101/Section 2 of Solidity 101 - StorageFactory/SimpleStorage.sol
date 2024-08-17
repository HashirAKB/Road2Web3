//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage{
    uint256 favouriteNumber;

    struct Person{
        uint favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) nameToFavouriteNumber;

    //Given virtual here because we're overriding this fn inside the AddFiveStorageContract.
    function store(uint256 _favouriteNumber)public virtual{
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    function addPerson(uint256 _favouriteNumber, string memory _name) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

}

contract SimpleStorage2{
    
}

contract SimpleStorage3{
    
}

contract SimpleStorage4{
    
}