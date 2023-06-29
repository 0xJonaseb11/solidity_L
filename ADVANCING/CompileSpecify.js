const fs = require('fs');
const solc = require('solc');

const contractPath = 'MyContract.sol'; //Specify contract here
const contractSource = fs.readFileSync(contractPath, 'utf8');

const input = {
  language: 'Solidity',
  sources: {
    [contractPath]: {
      content: contractSource,
    },
  },
  settings: {
    outputSelection: {
      [contractPath]: {
        'MyContract': ['abi', 'evm.bytecode'], //Specify contract here
      },
    },
  },
};

const output = JSON.parse(solc.compile(JSON.stringify(input)));     //Specify contract here
const contractBytecode = output.contracts[contractPath]['MyContract'].evm.bytecode.object;
const contractAbi = output.contracts[contractPath]['MyContract'].abi;

console.log('Bytecode:');
console.log(contractBytecode);
console.log('ABI:');
console.log(JSON.stringify(contractAbi));
