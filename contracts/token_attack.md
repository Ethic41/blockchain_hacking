# Token Challenge
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {
    mapping(address => uint) balances;
    uint public totalSupply;

    constructor(uint _initialSupply) public {
        balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
}

```
### task

The challenge goal is to raise your balance above 20 tokens

### solution

The vulnerability is integer underflow in the transfer function, to exploit it you just have to send a large amount for **_value** argument,
that is much larger than 20 e.g (100,000) and then transfer to any address. This will try to make the value of _value negative but since it's an unsigned integer,
it just wraps around to a very large value. You now have a very large value in your balance.

### steps

```javascript
// in your browser console
contract.tranfer(target_address, amount)

```
