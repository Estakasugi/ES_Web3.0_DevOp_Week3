// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract stateVarStorage {
    //state var to store a number
    uint256 public number;

    //Need to send a transaction to write a state variable.
    function set(uint256 _num) public {
        number = _num;
    }


    //can read from a state variable without sending a transaction.
    function get() public view returns(uint256) {
        return number;
    }

}