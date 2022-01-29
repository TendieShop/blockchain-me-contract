# BlockchainME Contract

Tell Your Story!

## Get started

- Install all the dependencies with `npm i`
- You can compile the contracts with `npm run contract`
- You can than run a node locally with `npm run node`
- To deploy the contract locally you can run `npm run deployLocal`
- You can also deploy it to the Ropsten environment with `npm run deployRopsten` (Make sure you uncomment the ropsten section in hardhat.config.js, and create a .env file with your PRIVATE_KEY)

Make sure to format the code with `npm run prettier`, if you have prettier the formatting should be automatic.(you might have to run this ones though)

## Solidity (These steps are not required if you follow the get started steps)

- This compiles the contracts in the contracts folder and creates the artifacts folder that allows for interaction with the front-end. `npx hardhat compile`
- This runs a node and provides wallets. `npx hardhat node`
- This runs the deploy script and adds a flag to the CLI that we would like to deploy to our local network: `npx hardhat run scripts/deploy.js --network localhost`
- This Runs the deploy scripts in the scripts folder and deploys to the selected environment: `npx hardhat run scripts/deploy.js --network ropsten`

## Licensing

The primary license for BlockchainME Contract is the Business Source License 1.1 (`BUSL-1.1`), see [`LICENSE`](./LICENSE).
