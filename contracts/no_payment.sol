// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract NoPayment {
    // I hate receiving funds

    fallback() external payable {
        while (true) {}
    }
}

