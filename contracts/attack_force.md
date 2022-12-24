# Force Attack

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

```

### task

The challenge goal is to raise the balance of the contract above zero

### solution

The attack required here is the forced ether attack, we create our contract, send some ether to it, and then selfdestruct it while pointing to 
the address of the **Force** contract, this will result in transfer of the ether in our contract to the **Force** contract

### steps

```javascript
// in your browser console

sendTransaction({
    from:your_address,
    to:contract_address,
    value:any_amount
})

```
