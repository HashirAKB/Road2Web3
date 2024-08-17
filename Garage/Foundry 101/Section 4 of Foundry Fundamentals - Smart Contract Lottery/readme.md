## Lottery DApp Project.

- Initialized the the foundry project using 'forge init'.
- Created contract raffle.sol.
- Initialized fns enterRaffle and pickWinner.
- Declared immutable entranceFee variable because it'll be a constant and used constructor to assign the value to it.
- Made the enterRaffle fn payable beacuse user need to send the entranceFee into it in order to participate on it.
- Implemented the getter fn to get the entrance fee.
- Went through solidity style guide before going funrther into writing the rest of smartcontract to keep it following the best practices.
- Made a list of things inorder in a smart contract accoring to style guide, put it in top of my smart contract so that I can follow along.
- Decided to use custom errors instead of error messages of type 'string' to save gas.
- Custom errors can be placed even out side of contract definition, But putting it inside the contract is the best practice always.
- When you writing the custom errors in solidity it's a best practice to name it with a prefix of 'contractName__' for the custom error function. This'll make the erros more readable.
- s_ prefix is the best practice to follow when writing storage variables.
- Initialized payable array of type address for store players.
- Went through solidity events to get better understanding before implementing event emissions for storage changes in the contract.
- Events allow you to print logs in a gas efficient manner.
- Wrote event inside the raffle contract to emit the event when a user enters into the raffle.
- made pickWinner and enterRaffle fns external.
- learned about chainLink VRF to implement random number logic in the contract.
- Wrote a new storage variable 'lastTimeStamp' which'll get populated with block.timestamp via constructor and implemented a check to verify the enough time is passed in between each rows.
- Imported chainlink vrfbase2plus into raffle contract.
- If we inherit a contract into another one, we need to add the constructor variables also into our contract constructed to which the other contract is inherited.
- Abstract contracts have both undefined fns and defined fns.
- Using the returned random number we're modding that by the length of the players array to get a single digit which is under the range of the lenght of the players array. And the player at the returned digit index'll be rewarded by the contract balance.
- Implemented the lottery contract state using enough which'll act as a entryGate/barrier as per the contract state. If it's calculating the winner, the state goes to 'calculating' from 'open' untill the winner got selected and during this time new participants won't be able to enter into the raffle.
- After the winner is selected, the timer and players array'll be resetted.
- Went through chainLink automation docs to undertand it before implenting decentralized automation on lottery smart contract for raffle automation.

### 21.07.2024
- Implemented 'upkeepNeeded' fn which'll be chekcing whether there's a space/time for a new raffle.
- Modified 'pickWinner' fn into 'perfromUpkeep Fn.
- Wrote custom error, which'll be thrown when there'sn't a need for a new round.
- Completed smartcontract, moved to writing tests.

### 22.07.2024
- Wrote a few tests.
- Wrote Deploy script for the raffle smart contract.
- Wrote VRFCoordinator mock, and the helperConfig fn to test raffle on local anvil chain.
- Wrote tests which checks:
    - Is raffle initializes in open state.
    - Whether raffle reverts when there's no value.
    - Whether raffle records the player when it enters into the raffle.
    - Whether raffle emits event when user enters into the raffle.
- Understood about expectEmit of foundry.
- Learned about vm.roll and vm.wrap which'll help to adjust the block timings during tests.
- Message:
    Welcome to Chainlink VRF!
    We require a signature in order to ensure you are the owner of the subscription.
    Wallet address:
    0x031370059ca3d89c9677f5c8537baec1693fdf17
    VRF Coordinator address:
    0x9ddfaca8183c41ad55329bdeed9f6a8d53168b1b
    Subscription ID:
    73670389760054196039323921057138130945134865764224876533276664585899177356797