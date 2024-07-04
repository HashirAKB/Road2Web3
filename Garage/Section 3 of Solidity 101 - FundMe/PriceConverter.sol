//SPDX-License-Identifier: MIT;
pragma solidity ^0.8.18;

//import chainlink interface. This gives a minimalist ABI to interract with the contract.
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

//not a contract, Hence library.
library PriceConverter{

    //These fns should be internal as this's a part of library.
    function getPrice() internal view returns(uint256){
        //This function'll fetch the price of ETH in terms of USD.
        //Addr 0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        //1ETH, 2000_0000000000000000
        uint256 ethPrice = getPrice();
        // (2000_0000000000000000 * 1000_0000000000000000) / 1e18 = $2000->1ETH
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        return priceFeed.version();
    }
}