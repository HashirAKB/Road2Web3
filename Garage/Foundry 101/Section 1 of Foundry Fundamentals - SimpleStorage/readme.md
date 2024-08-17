- In this section about foundry, we're learning fundamentals.
- Did all the local setup to do soldity development using Foundry.
- Wrote a script to deploy a simple contract using foundry.

- scripts usually named ending with .s.sol.
- $ forge script script/DeploySimpleStorage.s.sol
- $ forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545
- $ forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

- source .env
- forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY

- cast --to-base 0x714c2 dec ==> Will give the dec values.
- cast is a very useful command, look more into it's doc.

- cast wallet import alvin-local-0 --interactive
    Enter private key:
    Enter password: 
    `alvin-local-0` keystore was saved successfully. Address: 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266

- forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --account alvin-local-0 --broadcast
    [⠒] Compiling...
    Script ran successfully.
    ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.

- To send a Txn to the deployed contract address:
    - cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "store(uint256)" 123 --account alvin-local-0
        Enter keystore password:

        blockHash               0x959cb3a222a52dad7c8d0432b8635bc1201bb9ff02ffc62c6b893bfeb9e2e892
        blockNumber             4
        contractAddress         
        cumulativeGasUsed       43538
        effectiveGasPrice       676780035
        from                    0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
        gasUsed                 43538
        logs                    []
        logsBloom               0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
        root                    0x7fe56d0b737d020cc20fd9ac68678cec5ce00e0074ed8babfdfccea0175465a3
        status                  1 (success)
        transactionHash         0xcc04517559fc8adfec34c23d88ee52f54e0d2cc9c2007f1b582c557632a18451
        transactionIndex        0
        type                    2
        blobGasPrice            1
        blobGasUsed             
        to                      0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0

- TO CALL A FUNCTION:
    $ cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "retrieve()"
    0x000000000000000000000000000000000000000000000000000000000000007b //response in hexadecimal.
    $ cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec
    123

- Learned how to compile, deploy, and interact smart contracts with foundry CLI both in local and testnet chains: https://sepolia.etherscan.io/address/0x60a574cc18a15de3a0f6217cbaf5e233fda80770
- `sepolia-hashir-dev-f17` keystore was saved successfully. Address: 0x031370059ca3d89c9677f5c8537baec1693fdf17

- forge fmt --> to format the code.
- foundryup OR foundryup-zksync
- solidity txn types - 0x1, 0x2 etc.
