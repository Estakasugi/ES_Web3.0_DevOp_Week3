// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ImmutableReview {

    /*Immutable variables are like constants. 
    Values of immutable variables can be set inside the constructor
    but cannot be modified afterwards.*/

    address public immutable MY_ADDRESS; //0x0000000...
    uint256 public immutable MY_UNIT; // 0

    // constructor initialize values at the deployemnt of the contract
    constructor(uint256 _myUnit){
        MY_ADDRESS = msg.sender; // should no longer be the 0x00000 address
        MY_UNIT =  _myUnit;
    }
}