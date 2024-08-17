//Get funds from users.
//Withdraw funds.
//USD to SOL conversion.

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// //import chainlink interface. This gives a minimalist ABI to interract with the contract.
// import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; MOVED THIS INTO PriceConverter.sol, LOOK BELOW

//Custom library which I wrote.
import { PriceConverter } from './PriceConverter.sol';

error NotOwner(); //custom error handling.

//solidity revert. sending ETH to a fn.
contract FundMe{

    //Using this we can attach any variable/value of uint256 with the fns inside PriceConverter library.
    using PriceConverter for uint256;

    //Adding 18 0s after the UST value.
    uint256 public constant MINIMUM_USD = 5 * 1e18; //introducing constant'll help in optimising the gas fee. CAPS is the naming convention. Instead of storing this to the storage slot these'll be directly coded into bytecode.

    //Taking the address of the funder and the amount putting it into a list of funders.
    address public immutable i_owner; //since we're only using this in constructor and not gonna change, making it immutable'll reduce the gas cost. 'i_' is a naming convention to start immutable variable names. Instead of storing this to the storage slot these'll be directly coded into bytecode.
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    //constructor. This'll be run while the contract is deployed. The contract deployment txn itself executes this constructor.
    constructor(){
        i_owner = msg.sender;
    }

    uint256 count = 0;
    function fund() public payable{ //use payable to hold/txnt funds
        //Allow users to send $
        //Have a minimum to send $
        //How do we send ETH to this?
        count = count + 1;
        // require(msg.value > 1e18, "Didn't send enough ETH"); //The msg.value holds the amount that the txn send.
        // require(getConversionRate(msg.value) > MINIMUM_USD, "Didn't send enough ETH"); //Here we're using the fn to get the ethAmountInUSD. INSTEAD OF THIS CODE, WROTE:
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough ETH"); //Uses PriceConverter library here. 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    //Blockchain Oracle: Any device that interacts with the external world to provide external data or computation to smartcontracts.
    //Chainlink is a decentralized oracle nw.

    //Understood interfaces in solidity.

    function withdraw() public onlyOwner{
        //owner check
        // require(msg.sender == owner, "Must be owner");
        //resetting addressToAmountFunded mapping.
        for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //resetting funders array
        funders = new address[](0);

        //To withdraw funds we've 3 methods: transfer, send, and call.
        //transfer
        // payable(msg.sender).transfer(address(this).balance); //Throws error by default if the txn fails.
        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //since it returns bool, we need to write additional logic incase we need to rever the txn on fail
        // require(sendSuccess, "send failed");
        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
        //THE ABOVE METHOD SHOULD BE MOVED AS A CONSTRUCTOR, ELSE ANYBODY CAN CALL THE FN AND WITHDRAW THE FUNDS.
    }

    //MOVED THIS INTO PriceConverter.sol
    // function getPrice() public view returns(uint256){
    //     //This function'll fetch the price of ETH in terms of USD.
    //     //Addr 0x694AA1769357215DE4FAC081bf1f309aDC325306
    //     //ABI
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    //     (,int256 price,,,) = priceFeed.latestRoundData();
    //     return uint256(price * 1e10);
    // }

    // function getConversionRate(uint256 ethAmount) public view returns(uint256){
    //     //1ETH, 2000_0000000000000000
    //     uint256 ethPrice = getPrice();
    //     // (2000_0000000000000000 * 1000_0000000000000000) / 1e18 = $2000->1ETH
    //     uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
    //     return ethAmountInUSD;
    // }
    //MOVED THIS INTO PriceConverter.sol

    //Modifier: Allow's to create a keyord that can be used in fn declaration for some additional functionalities/ properties. This is a replacement of line 53: require(msg.sender == owner, "Must be owner");
    modifier onlyOwner(){

        // require(msg.sender == i_owner, "Sender is not owner"); //REPLACED WITH LINE BELLOW
        if(msg.sender != i_owner){ revert NotOwner(); } //Custom error.

        _; //if the _; is first, then the fn'll be get executed and then only the modifier gets executed and vise versa.
    }

    //These lines'll automatically routes to the fund fn if somebody tries to do a txn without using the fund fn.
    receive() external payable{
        fund();
    }
    fallback() external payable{
        fund();
    }
}