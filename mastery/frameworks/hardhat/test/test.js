const { expect } = require("chai");
const hre = require("hardhat");
const { ContractTransactionDataAndInputError } = require("web3");
const ethers = hre.ethers;

describe("Counter Contract", function() {
  let contract;

  before(async function() {
    console.log("Getting contract factory...");
    const Contract = await ethers.getContractFactory("Counter");

    console.log("Deploying contract...");
    contract = await Contract.deploy();

    console.log("Waiting for contract to be deployed...");
    await contract.deployed();

    console.log("Contract deployed at:", contract.address);
  });

  it("Should default the value of num to 0", async function() {
    console.log("Calling getNum()...");
    const num = await contract.getNum();
    console.log("Value of num:", num);
    expect(num).to.equal(0);
  });

  describe("Increment", function() {
    it("Should increment num by 1", async function() {
      let tx = await contract.increment();
      await tx.wait();
      expect(await contract.getNum()).to.equal(1);
    });

    describe("Decrement", function() {
      it("Should decrement num by 1", async function() {
        let tx = await contract.decrement();
        await tx.wait();
        expect(await contract.getNum()).to.equal(0);
      });
    });
  })
});
