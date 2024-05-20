// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ConstantsReview {
    /*Constants are variables that cannot be modified.
        Their value is hard coded and using constants can save gas cost.*/
    
    address public constant My_ADDRESS = 0x0fEf8253cAF8C6c23BE22830407aEF019A5eaa4b;
    uint256 public constant My_uint = 777;
}