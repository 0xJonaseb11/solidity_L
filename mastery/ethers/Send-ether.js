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

