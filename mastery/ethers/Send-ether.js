const { ethers } = require("ethers");
const dotenv = require("dotenv");
require("dotenv").config();

const sender_pvt_key = process.env.PRIVATE_KEY;
const receiver_address = "0xcfdEf8165d722DC56a1FD06923de261B5B9d8626";
const amount = "0.5";

let provider = ethers.getDefaultProvider("sepolia");

let sender_wallet = new ethers.Wallet(sender_pvt_key, provider);

let txn = {
    to: receiver_address,
    value: ethers.utils.parseEther(amount)
}

// send txn
sender_wallet.sendTransaction(txn).then((result) => {
    console.log("TxHash:", result.hash);
    console.log("Sender wallet address:", sender_wallet.address);
});

// Interact with the contract 
const contract_address = "0xb663C3eF12b014Df88DbC9b0A7e68a1d964a53FC";
const contract_ABI = [
    { inputs: [], stateMutability: "nonpayable", type: "constructor" },
 {
   inputs: [],
   name: "decrement",
   outputs: [],
   stateMutability: "nonpayable",
   type: "function",
 },
 {
   inputs: [],
   name: "increment",
   outputs: [],
   stateMutability: "nonpayable",
   type: "function",
 },
 {
   inputs: [],
   name: "variable",
   outputs: [{ internalType: "uint8", name: "", type: "uint8" }],
   stateMutability: "view",
   type: "function",
 },
]

// contract interaction
const contract = new ethers.Contract(contract_address, contract_ABI, provider);


// real interaction
const interact = async() => {
  const value = await contract.variable();
  console.log(value);

  // connect wallet to the smart contract
const contractWithSigner = contract.connect(sender_wallet);

const txn = await contractWithSigner.decrement();
await txn.wait();
console("TxHash:", txn.hash);
}

interact();


