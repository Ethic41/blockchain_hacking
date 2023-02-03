// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Preservation {

    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint storedTime;

    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    constructor(address _timeZone1LibraryAddress, address _timeZone2LibraryAddress) {
        timeZone1Library = _timeZone1LibraryAddress;
        timeZone2Library = _timeZone2LibraryAddress;
        owner = msg.sender;
    }

    function setFirstTime(uint _timeStamp) public {
        (bool result, ) = timeZone1Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
        result;
    }

    function setSecondTime(uint _timeStamp) public {
        (bool result, ) = timeZone2Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
        result;
    }
}

contract LibraryContract {
    uint storedTime;

    function setTime(uint _time) public {
        storedTime = _time;
    }
}

