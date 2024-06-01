const { expect } = require("chai");
const hre = require("hardhat");
const ethers = hre.ethers;


const { describe, before } = require("node:test");

describe("Counter Contract", () => {
  let contract;
  before(async function() {
    const Contract = await ethers.getContractFactory("Counter");
    contract = await Contract.deploy();
  })

  it("Should default the value of num to 0", async function() {
    expect(await contract.getNum()).to.equal(0);
    // expect(<result>).to.equal(<expected value>)

  })

});