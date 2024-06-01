require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

module.exports = {
  solidity: "0.8.19",
  networks: {
    hardhat: {},
    sepolia: {
      url: process.env.INFURA_NODE_URL,
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
  },
};