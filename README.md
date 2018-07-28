# Eth_Grade_Manager

This is the example from [A Beginner’s Guide to Blockchain Programming](https://hackernoon.com/a-beginners-guide-to-blockchain-programming-4913d16eae31)
written by [Febin John James](https://twitter.com/heyfebin).

## Getting started
1.Install dependencies. [ganache-cli](https://github.com/trufflesuite/ganache-cli)、(web3.js)[https://github.com/ethereum/web3.js/]、(solc)[https://www.npmjs.com/package/solc]
    
    $ npm install
    $ node_modules/.bin/ganache-cli
        
2.Compile solidity code.
    
    $ node
    $ code = fs.readFileSync('Grades.sol').toString()
    $ solc = require('solc')
    $ compiledCode = solc.compile(code)
    
3.Deploy the code on ethererum praivate newtwork by using web3.js.
    
    $ Web3 = require('web3')
    $ web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
    $ abiDefinition = JSON.parse(compiledCode.contracts[':Grades'].interface)
    $ GradesContract = web3.eth.contract(abiDefinition)
    $ byteCode = compiledCode.contracts[':Grades'].bytecode
    $ deployedContract = GradesContract.new(['John','James'],{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})

## How to use
Give Grade A+ to John by follwing code.

    $ deployedContract.giveGradeToStudent('John', 'A+', {from: web3.eth.accounts[0]})    

Call john's grade.
    
    $ deployedContract.getGradeForStudent.call('John')
    'A+'
