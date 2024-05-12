const fs = require('fs');
const solc = require('solcjs');

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
        'SafeMath':['abi', 'evm.bytecode'],
        'Math':['abi', 'evm.bytecode'],
        'UsingInheritance':['abi', 'evm.bytecode'] ,     
      },
    },
  },
}

//Catching errors
try {
  const output = JSON.parse(solc.compile(JSON.stringify(input)));
  if (output.errors) {
    throw new Error(output.errors[0].formattedMessage);
  }


     //Specify contract here
const contractBytecode = output.contracts[contractPath]['MyContract','SafeMath', 'UsingInheritance'].evm.bytecode.object;
const contractAbi = output.contracts[contractPath]['MyContract', 'Math', 'UsingInheritance'].abi;

  // Saving output to separate files
  fs.writeFileSync('MyContract_bytecode.txt', contractBytecode);
  fs.writeFileSync('MyContract_abi.json', JSON.stringify(contractAbi));

console.log('Bytecode:');
console.log(contractBytecode);
console.log('ABI:');
console.log(JSON.stringify(contractAbi));
}

catch (error) {
  console.error('Compilation error:', error.message);
}

