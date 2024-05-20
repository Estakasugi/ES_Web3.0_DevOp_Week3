//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VariableAndScale {
    /*
    There are 3 types of variables and scales in Solidity

    local
        declared inside a function
        not stored on the blockchain
    state
        declared outside a function
        stored on the blockchain
    global (provides information about the blockchain)

    */
    //below are state variables, they are stored on the blockchain
    string public text = "onChian";
    uint256 public num = 123;

    function scaleTesting() public view returns(uint256, uint256, address){
        // local variables are not saved to the blockchain <----this is very important
        uint256 i = 456;

        //Here are some global variables(information of the blockchiani itself)
        uint256 timestamp = block.timestamp; // curent block timestamp
        address sender = msg.sender; // address of the caller

        return(i, timestamp, sender);
    }
}
