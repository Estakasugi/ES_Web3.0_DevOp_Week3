// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol"; 

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minUSD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public owner;
    // call imediately whenever the contract is deployed
    constructor(){
        owner = msg.sender; // the msg.sender of the constructor is going to be whoever deployed the contract
    }


// Two of the main functions
    function fund() public payable {
        //msg.value.getConversionRate();

        //able to set a min fund amount in usd
        //1. how to send eth to this contract
        require(msg.value.getConversionRate() >= minUSD, "Didn't send enough"); // 1e18 = 1* 10^(18) uint of wei
        //revert messeage: undo any action before, and send remaining gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

    }


    function withdraw() public onlyOwner{
        
        //for (/*starting index, end loop situation, step amount*/)
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset array，make funder a black array
        //funders @4:42:11 
        funders = new address[](0); 
        //actually withdraw

        //transfer
        //msg.sender - > address
        //payable(msg.sender) -> payable address
        /*payable(msg.sender).transfer(address(this).balance);*/

        //send
        /*bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "send failed"); // therefore if the send failed, the transaction is still reverted
        */

        //call ---> this is the way how to efficiently transfer ether
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

    }


    modifier onlyOwner {
        require(msg.sender == owner, "sender is not the owner!");
        _; // this means when to run the code. in this case, run the code after the require
    }


}