// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Loop {

    /*
    Solidity supports for, while, and do while loops.

    Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail.

    For the reason above, while and do while loops are rarely used.
    */

    function loopReview(uint256 _loopnum) public pure returns(uint256) {
        //for loop
        for (uint256 i = 0; i < _loopnum; i++) {
            if (i == 3) {
                //skip to next iteration with continue
                continue; 
            }
            if (i == 5) {
                //Exit loop with break
                break;
            }
        }


        //while loop
        uint256 j;
        while (j < _loopnum){
            j++;
        }

        return j;

    }
}