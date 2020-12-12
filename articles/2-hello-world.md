# Hello World

Let's start by creating our first smart contract in [truffle](https://github.com/trufflesuite/truffle)! Make sure you have truffle installed:

```
npm install -g truffle
truffle -v
```


Initialize a truffle project and create our HelloWorld smart contract solidity file:
```
mkdir hello-world
cd hello-world

truffle init
truffle create contract HelloWorld
```

`truffle init` will create three different directories: `../contracts`, `../migrations`, and `../test`. It will also create a config file `truffle-config.js`

`truffle create contract` will create a new file `../contracts/HelloWorld.sol` 


Next let's take a look at our [example HelloWorld contract](../truffle-hello-world/contracts/HelloWorld.sol):
```
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract HelloWorld {
  string message;
  
  constructor() public {
    message = "Hello World";
  }
  
  function getMessage() public view returns(string memory){
    return message;
  }
}
```
A Solidity contract can be boiled down to a collection of its functions (`getMessage()`) and its state (`string message`)

Functions in Solidity are structured like `function FnName(args...) VISIBILITY STATE-MUTABILITY returns (TYPE DATA-LOCATION...)`

`VISIBILITY` can be one of:
- `external`: part of the contract interface, can be called by other contracts, but cannot be called internally
- `public`: part of the contract interface, can be called internally and by other contracts
- `internal`: not part of the contract interface, can only be called internally
- `private`: only visible within the defining contract, not visibile in derived contracts

`STATE-MUTABILITY` by default can read and modify state, but if specified can be one of:
- `pure`: will not read or modify state, if possible always make functions pure
- `view`: will read state but will not modify state

`TYPES` can be one of:
- `int` (`int8`...`int256`, `uint8`...`uint256`)
- `bool`
- `address`
- `bytes`
- `string`
- `hex`
- `enum`

`DATA-LOCATION` can be one of:
- `storage`: permanent global data that is scoped to the contract and can be accessed by any of its functions, fairly expensive, contract state variables are always stored in storage
- `memory`: temporary local data only accessible within the scope of the function, cheaper than storage, return parameters are always stored in memory
- `calldata`: special data location for incoming function execution data, function arguments are always stored in calldata
- `stack`: non-persistent data maintained by the EVM (Ethereum Virtual Machine)

In our HelloWorld example, we have a public constructor which sets the contract's message to "Hello World" as a `string` in the `storage` location. We define a function to get the message which is `external` because it does not need to be called internally and we want it to be callable by other smart contracts. It's mutability is `view` because we want to read the message data in `storage` and we return the message as a `string` in `memory`.


With some of the basics out of the way and our first HelloWorld contract in hand, let's compile!
```
truffle compile
```

This command will compile your smart contracts and write build artifacts to `../build/contracts`. Compiling Solidity generates `.json` artifacts.


## Extra Reading
The Solidity docs are great and dive-deep into the details of the concepts discussed in this article.

- [Intro To Smart Contracts](https://docs.soliditylang.org/en/v0.7.4/introduction-to-smart-contracts.html)
- [Types](https://docs.soliditylang.org/en/v0.7.4/types.html)
- [Contracts](https://docs.soliditylang.org/en/v0.7.4/contracts.html)


## Onwards!
Next, we will look into how to [deploy and interact with our smart contract locally](./3-deployment.md)