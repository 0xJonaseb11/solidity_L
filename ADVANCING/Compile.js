const fs = require('fs');
const solc = require('solc');

const contractPath = 'MyContract.sol';
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
      '*': {
        '*': ['abi', 'evm.bytecode'],
      },
    },
  },
};

const output = JSON.parse(solc.compile(JSON.stringify(input)));
const contractBytecode = output.contracts[contractPath]['MyContract'].evm.bytecode.object;
const contractAbi = output.contracts[contractPath]['MyContract'].abi;

fs.writeFileSync('MyContract_bytecode.txt', contractBytecode);
fs.writeFileSync('MyContract_abi.json', JSON.stringify(contractAbi));

//To get the output on the terminal
console.log('Bytecode:');
console.log(contractBytecode);
console.log('ABI:');
console.log(JSON.stringify(contractAbi));
