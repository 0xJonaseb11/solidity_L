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

try {
  const output = JSON.parse(solc.compile(JSON.stringify(input)));
  if (output.errors) {
    throw new Error(output.errors[0].formattedMessage);
  }

  const contractBytecode = output.contracts[contractPath]['MyContract'].evm.bytecode.object;
  const contractAbi = output.contracts[contractPath]['MyContract'].abi;

  // Saving output to separate files
  fs.writeFileSync('MyContract_bytecode.txt', contractBytecode);
  fs.writeFileSync('MyContract_abi.json', JSON.stringify(contractAbi));

  // Displaying output in the terminal
  console.log('Bytecode:');
  console.log(contractBytecode);
  console.log('ABI:');
  console.log(JSON.stringify(contractAbi));
} catch (error) {
  console.error('Compilation error:', error.message);
}
