// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract IfElse {
    function foo(int256 _inpt1) public pure returns (uint256) {
        if (_inpt1 < 10) {
            return 0;
        } else if (_inpt1 < 20) {
            return 1;
        } else {
            return 2;
        }
    }


    function shortExpress(uint256 _inpt2) public pure returns (bool) {
        /*
        if (_inpt2 < 12) {
            return true;
        } else {
            return false;
        }
        */
        
        return _inpt2 < 12 ? true : false;
    }
}