const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("BlockchainMe", () => {
  it("Should mint an NFT", async () => {
    const BlockchainME = await ethers.getContractFactory("BlockchainME");
    const blockchainMe = await BlockchainME.deploy();
    await blockchainMe.deployed();

    const recipientsPublicKey = "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266";
    const metadataURI = "cid/test.png";

    const balance = await blockchainMe.balanceOf(recipientsPublicKey);
    expect(balance).to.equal(0);

    const newlyMintedToken = await blockchainMe.mintPost(metadataURI, {
      value: ethers.utils.parseEther("0.05"),
    });

    // Wait until the transaction is minted
    await newlyMintedToken.wait();

    // TODO verify who owns the token
    // const newBalance = await blockchainMe.balanceOf(recipientsPublicKey);
    // expect(newBalance).to.equal(1);

    expect(await blockchainMe.postId()).to.equal(1);

    // TODO verify that the ranking system works
  });
});
