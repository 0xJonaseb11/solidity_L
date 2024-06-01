const hre = require("hardhat");
const ethers = hre.ethers;

const main = async() => {
  const signers = await ethers.getSigners();

  const account = await ethers.getSigner(
    "0x70997970C51812dc3A010C7d01b50e0d17dc79C8"
  );

  const Counter = ethers.getContractFactory("Counter");
  const counter = Counter.deploy();

  console.log("Deploying Counter contract...")

  await counter.deployed();

  console.log("Counter contract deployed to:", counter.address);

  const MyContractABI =
 require("../artifacts/contracts/Counter.sol/Counter.json");
const MyContractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

const MyContract = await ethers.getContractAtFromArtifact(
  MyContractABI,
  MyContractAddress
);

}

main();