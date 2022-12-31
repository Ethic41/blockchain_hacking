// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NaughtCoin is ERC20 {
    
    uint public timeLock = block.timestamp + 10 * 365 days;
    uint256 public INITIAL_SUPPLY;
    address public player;

    constructor(address _player) ERC20('NaughtCoin', '0x0') {
        player = _player;
        INITIAL_SUPPLY = 1_000_000 * (10 * uint256(decimals()));
        
        _mint(player, INITIAL_SUPPLY);
        emit Transfer(address(0), player, INITIAL_SUPPLY);
    }

    function transfer(address _to, uint256 _value) override public  lockTokens returns(bool) {
        return super.transfer(_to, _value);
    }

    modifier lockTokens() {
        if (msg.sender == player) {
            require(block.timestamp > timeLock);
            _;
        }
        else {
            _;
        }
    }
}

