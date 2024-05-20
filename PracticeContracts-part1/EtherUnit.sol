// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract EtherUnit {
    uint256 oneWei = 1 wei;
    // 1 wei is equal to 1;
    bool public isOne = (oneWei == 1);

    uint256 public oneGwei = 1 gwei;
    //1 gwei is equal to 10^9 wei, eual to 1^9
    bool public isOneG = (oneGwei == 1e9);
    bool public isOneGwei = (oneGwei == 1e9 wei);

    uint256 public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei, square of Gwei
    bool public isOneEther = (oneEther == 1e18);
    bool public isSquareGwei = (oneEther == (oneGwei)**2);

}