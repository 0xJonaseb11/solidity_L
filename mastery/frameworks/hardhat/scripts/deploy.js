const hre = require("Hardhat");
 
async function main() {
 const MyContract = await hre.ethers.getContractFactory("MyContract");
 const myContract = await MyContract.deploy();
 
 await myContract.deployed();
 console.log("Contract address: ", myContract.address);
}
 
// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
 console.error(error);
 process.exitCode = 1;
});