// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./PriceConverter.sol"; 
//before modification, this contract costs 842052 gas
// use keywords: const, immutable to reduce the gas

error NotOwner(); 

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    //I added the constant keyword here, saved 19554 gas -> this is nearly
    // transaction cost = gas * gas price (141gwei per gas at ethreum)

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    //add immutable would save 43025 gas (include the constant gas save), and remember to change the variable with i_ in front

    // call imediately whenever the contract is deployed
    constructor(){
        i_owner = msg.sender; // the msg.sender of the constructor is going to be whoever deployed the contract
    }
    // after the immutable changes, total tranaction gas becomes: 799027 gas

// Two of the main functions
    function fund() public payable {
        //msg.value.getConversionRate();

        //able to set a min fund amount in usd
        //1. how to send eth to this contract
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough"); // 1e18 = 1* 10^(18) uint of wei
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
        //require(msg.sender == i_owner, "sender is not the owner!");
        if(msg.sender != i_owner) {
            revert NotOwner();
        }
        _; // this means when to run the code. in this case, run the code after the require
    }

    // What happens if someone sends this contract Eth without calling the fund function?

    receive() external payable {
        fund();
    }
    
    fallback() external payable {
        fund();
    }

}