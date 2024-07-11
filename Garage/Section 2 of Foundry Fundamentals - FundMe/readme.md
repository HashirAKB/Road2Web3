
- forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit
    - Using this command we can install the smartcontracts/tools into the lib folder of foundry project.

- Foundry config edit: made remapping. remappings = ["@chainlink/contracts/=lib/chainlink-brownie-contracts/contracts"]
    - This'll map the import from remote to local import that's present in lib folder.

- forge test -vvv [No of v = no.of console messges.]
    - This'll print the console.log msgs according to the numbers of v's present.

- forge test --match-test testPriceFeedIsAccurate -vv ==> To run a specific test
    - To run a specific test. Try forge test --help for more.
    
- forge test --match-test testPriceFeedIsAccurate -vvv --fork-url $SEPOLIA_RPC_URL
    - This is used to run the test on the sepolia test net.

- forge coverage --fork-url $SEPOLIA_RPC_URL ==> To get code coverage.

- Learned to write and test smart contrats with tests.

- Learned modular deployments and tests.

- forge test --match-test testPriceFeedIsAccurate -vvv --fork-url $SEPOLIA_RPC_URL ==> Inorder to run this test on local anvile chain, we need to use a mock contract. So creating a fake priceFeed and then deploying it on oru local anvil.

- anything before startbroadcast is not accounted as a real txn.

- 