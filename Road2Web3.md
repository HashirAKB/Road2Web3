I'm writing this based on the information that I got from these youtube videos:
    1. How to master WEB3 in 2024 (Complete Roadmap and Syllabus) [ https://youtu.be/D5CGlFQbgnk ]
    2.

#1
- Main core thing to get best at anything is build really good projects.
- Blockchains: Layer 0, Layer 1, and Layer 2.
- L1: Bitcoin, Ethereum, Solana, Sui, Aptos.
    - Introduced earlier, Bought the concept of decentralized money.
    - Most activity on web3 concentrates over here.
- L0: Polkadot, Cosmos.
    - It's difficult to build your own blockchain, hence L0 protocols where introduced.
    - Usually L0 helps to build L1 blockchains.
- L2: Polygon, Optimism, Arbitrum
    - Helps to scale L1s like ethereum.
    - L2s have therir own blockchains, But from time to time they put all the transactions on ethereum.
- web3 usecase 1: Today wallets are one of the biggest use case of crypto
    - Wallets usually makes money through swap feeses, and promotions/ ads.
    - Few wallets: phantom (MultiChain), metamask, wallet connect, backpack (MultiChain)
- web3 usecase 2: Decentralized Exchanges
    - Makes money using swap fees
    - Examples on solana: Orca, Meteora, Jupiter
    - Examples on ethereum: 1inch, uniswap
    - They usually have the smartcontracts for the swaps and the fronted. But we can buid our own frontends, tokens etc also.
- web3 usecase 3: NFT Market places
    - Examples: OpenSea, Blur
- web3 usecase 4: Centralized exchanges
    - Examples: wazirX, coinDCX, coinbase, Binance
- Some more web3 usecases:
    - Decentralized filestorage (ipfs, filecoin, arweave) - for examples NFTs are usually stored here.
    - RPC Providers (Alchemy, QuickNode)
    - Token Launchpads, NFT Launchpads
    - Stable coins (USDT)
    - Decentralized funding, Gaming
    - General web3 consultation

- Mental Model to learn web3:
    - Normall web3 jobs: 70% of time in web 2 tasks, 30% of time on smart contracts.
    - 70% where mostly by using JS, Browsers/Extensions, Some backends and frontend technologies, Bash/Terminal, RPC calls, Deployments [ Everyone'll be Mostly Active here]
    - 30% where mostly by using ETH/Solidity, Solana/RUST, Sui-Aptos/Move, and heavy testing/auditing of smartcontracts. [ It takes some time to deploy new smart contracts and all because of this auditing is there. So happenings are comapritively less]
    - A good understanding of integrating web3 stuff into web2/ frontends is required.
    - A normal web3 projects are structured like:
        - Src:
            - centralized backend
            - frontend
            - programs/ smartcontracts

- Example Syllabus
    - Foundation:
        1. Why blockchains? what do they provide.
        2. What is decentralization.
        3. RPCs, common RPC methods.
        4. Wei vs Ether, lamports vs SOL.
        5. Cryptography, hashing, encryption.
        6. Gas and Transactions.
        7. Public & Private keys, Mnemonic Phrases, Creating your own private keys.
        8. What are tokens, and NFTs.
        9. Basic cryptography.
        10. Signing messages using private keys.
        11. Devnet vs Mainnet environments.
        12. Airdropping.
        13. Understanding block explorers (etherscan, solscan).

        End Goal:
            - Create a CLI wallet.
            - Generate private and public keys using CLIs.
            - Airdrop some native tokens.
            - Do some txns using CLI ( send tokens )
            - Explore txns on exploeres.

    - Wallets:
        1. Why do you need a wallet, Why are wallets extensions?
        2. How do they secure your private key?
        3. Connecting to RPCs from wallets. [Common txns and queries you can send, How to parse the responces. ]
        4. Native Tokens vs ERC20.
        5. Showing token and NFT balances.
        6. How do wallets interacts with dApps.
        7. Signing msgs vs signing txns.
        8. Common Derivation Path.
        9. Creating a website similar to 'mynearwallet.com'. [ This is a web based wallet, but not very ideal to do so. why? ] Built it on both solana and ethereum - Multichain web based wallet.
        10. Creata a wallet impersonator ( why this is a controversial topic? ) that lets's you impersonate someone.

        End Goal:
            - Use an existing wallet, get comfortable with it's UX
            - Create a react app that lets you create wallets and impersonate them.
    
    - Dapps & Txns:
        1. Understanding txns and commonly done txns on chain (sends, swaps, Smart contract interactions etc.)
        2. Parsing txns to show data in a wallet.
        3. Logs, events, and indexed parameters on eth.
        4. Creating a:
            - Wallet Aggragator
            - Portfolio Tracker
            - Airdrop notifier
              Ex: matirca.io, assetdash.com

        End goal:
            - Understanding lots of common txn formats, parsing them
            - Creating a portfolio / Airdrop tracker.

    - DEXs and Swap Functionality:
        1. Understanding what are DEXs.
        2. Liquidity pools.
        3. Automated market makers.
        4. Creating your own token, creating a pool for it.
        5. Adding swap functionality (Using exisiting deployed smart contracts) to your wallet, letting users chose from popular markets.

        End goal:
            - Adding swap functionality to your wallet.
            - Adding txn parsing so all swaps are visible on your wallet.
    
    Projects at this point: Website based wallet like near, Cross chain wallet aggregator where one can collect all of your wallets and look at tokens, nfts, txns etc that u have.
    Projected Time: 3-4 months
    Goal: Mostly understand a lot of client side logic, Understand/Build web3 interacting websites without creating a smart contract on it. Understand the 80% of stuff.

    - Solidity and smart contracts [ ~1 Month ]:
        1. What are smart contracts?
        2. Solidity Syntax, data model (How do u store/charge data) on ETH
        3. Remix vs Truffle, Ganache vs Foundry (Tools that lets u create/test smartcontracts)
        4. Openzeplin (One of the popularly available smart contract that can be extended and used in ones application)
        5. Bytecode, ABIs and EVM
        6. Writing contracts.
            - Creating ERC 20.
            - Extending ERC 721.
            - Writing an Escrow contract.
            - Creating a restricted NFT mint (web2 + web3 usecase).
        7. Exploring common contracts.

        End goal:
            - Writing smartcontracts.
            - Local development of solidity.
            - web2 + web3 use case of adding custom minting logic.

    - Creating a Dapp:
        1. Creating a react project with web3 signin, learn about adapters, connecting to dapps.
        2. Creating a web2 backend with verification (Python/Node.js).
        3. Create frontend for nft mint with allowlist.
        4. Create frontent for escrow contract.
        5. Integrating external wallets to our application.

        End goal:
            - Adding frontends to dapps.
            - ETH Adapters

    - Rust and Solana Smart contracts:
        1. Rust Complete Bootcamp.
        2. Solana CLI, solana token program (Understand the code of the token program, metadata pgm to understand how to create tokens and attach metadata to them. Create our own token and attach metadata).
        3. Data Model in solana, PDAs.
        4. PDAs in action. Creating a web2 usecase in web3. PostGres tables vs PDAs.
        5. Create an escrow contract.
        6. Deep dive into solana token program and associated token account program.
        7. Attaching metadat to tokens and NFTs.
        8. Exploring common contracts.

        End goal:
            - Writing smart contracts in solana.
            - Local Solana development.
    
    - Indexing Blockchains:
        1. Understanding how to get payments the right way in a web2 app.
        2. Understanding indexing of the blockchain on ETH.
        3. Sweeping wallets, gas operations
        ? Why we need this: Every web2 usecase in which we need to make crypto payments we need indexing of blockchains.

        End goal:
            - Indexing blockchain.
            - Accepting the payments the right way.
    
    - Building an Exchange/Gambling website:
        1. Creating an orderbook/ create game logic.
        2. Allowing deposit and withdrawal logic.
        3. Storing the private key, hot'nd cold wallets, sweeping deposits, shamirs secrets.

        End goal:
            - Create an DEX or gambling website.

    A few free resources:
        1. https://www.alchemy.com/university/courses
        2. https://updraft.cyfrin.io/
        3. https://spl.solana.com/
        4. https://www.soldev.app/course
