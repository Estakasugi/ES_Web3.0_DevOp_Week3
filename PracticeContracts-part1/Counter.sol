//SPDX-License-Identifier: MIT
pragma solidity  ^0.8.24;

contract Counter {

    uint256 count;

    function getCount() public view returns(uint256) {
        return count;
    }

    function countInc() public {
        count++;
    }

    function countDec() public {
        require(count >0, "count cannot be smaller than 0");
        count--;
    }
}