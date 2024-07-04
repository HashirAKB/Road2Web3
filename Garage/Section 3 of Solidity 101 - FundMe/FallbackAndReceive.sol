//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

//These concepts are implemented in fundMe.sol. check that out.
contract fallbackReceive{
    uint public result;

    receive() external payable{ //Not using the keyword 'function' here. solidity knows.
        result = 1;
    } //If any txn came into the contract `without any data` this receive'll get executed.

    fallback() external payable{ //Not using the keyword 'function' here. solidity knows.
        result = 2;
    } //If any txn came into the contract `with any data` this receive'll get executed.

}