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
