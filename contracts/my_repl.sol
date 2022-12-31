// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Repl {

    function get_bytes8(bytes32 value) public pure returns (bytes8) {
        return bytes8(value);
    }

    function get_keccak256(bytes memory value) public pure returns (bytes32){
        return keccak256(abi.encodePacked(value));
    }

    function get_uint64(bytes8 value) public pure returns (uint64) {
        return uint64(value);
    }

    function get_uint64_size() public pure returns (uint) {
        return type(uint64).max;
    }

    function xor_values(uint64 value1, uint64 value2) public pure  returns (uint) {
        return value1 ^ value2;
    }

}
