const { expect } = require("chai");
const hre = require("hardhat");
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
});
