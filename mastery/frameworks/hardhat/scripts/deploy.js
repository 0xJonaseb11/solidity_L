const hre = require("hardhat");
const ethers = hre.ethers;

const CounterContractABI = require("../artifacts/contracts/Counter.sol/Counter.json");
const CounterContractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

const main = async() => {
  // get signer
  const account = await ethers.getSigner("0x70997970C51812dc3A010C7d01b50e0d17dc79C8");

  const Counter = await ethers.getConctractAtFromArtifact(CounterContractABI, CounterContractAddress);

  try {
    // fetching initial value of num
    var num = await Counter.getNum();
    console.log("The initial value of num is:", num.toString());

    // incrementing num using (first) default account
    let txIn = await Counter.increment();
    await txIn.wait();
    console.log("Num has been incremented by first account!");

    // fetching new value of num
    num = await Counter.getNum();
    console.log("The incremented value of num is:", num.toString());

    // decrementing num using (second) account
    let txDec = await Counter.connect(account).decrement();
    await txDec.wait();
    console.log("Num has been decrememted by second account");

    // fetchin new value of num
    num = await Counter.getNum();
    console.log("The decremented value of num is:", num.toString());
  } catch(err) {
    console.error(err);
  }
}

main();