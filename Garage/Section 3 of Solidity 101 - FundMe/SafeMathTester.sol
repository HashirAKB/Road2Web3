//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SafeMathTester{
    // On older solidity versions if bignumber got beyong 255(max value that can store by a uint8 it'll be round back to zero. So if the add fn got executed, the value of bigNumber will change to 0. But this later got fixed by soldity version 0.8 and later in which it'll check whether the given valu exceeds the maximum value that can be stored.)
    uint8 bigNumber = 255;
    function add() public{
        bigNumber = bigNumber + 1;
    }

    // This unchecked will excempt solidity compiler from checking the max value in solidity ^0.8. ie, basically both these fn'll behave same.
    function add2() public{
        unchecked{ bigNumber = bigNumber + 1;} //unchecked is used in some placer for better management of gas cost.
    }
}