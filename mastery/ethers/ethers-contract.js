const { ethers } = require("ethers");
 
const sender_pvt_key =
 "01f4c8d7e68443f90b3e0ca9b6f1be195a5daa43695cb2a62e17e78fb6892bea";
 
let provider = ethers.getDefaultProvider("sepolia");
let sender_wallet = new ethers.Wallet(sender_pvt_key, provider);
 
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
];
 
const contract = new ethers.Contract(contract_address, contract_ABI, provider);
 
async function interact() {
 const value = await contract.variable();
 console.log("Previous value:", value);

 const contractWithSigner = contract.connect(sender_wallet);
 const tx = await contractWithSigner.decrement();
 
 await tx.wait();
 console.log("Tx Hash: ", tx.hash);
 const newValue = await contract.variable();
 console.log("Current Value: ", newValue);
}
interact();