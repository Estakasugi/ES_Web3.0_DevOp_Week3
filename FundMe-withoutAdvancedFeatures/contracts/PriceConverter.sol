//// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts@1.1.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    /* This function using aggregator interface to get price*/
        function getPrice() internal view returns(uint256) {
        //1. ABI of a contract
        // interface
        //2. Address of a contract
        //0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData(); // price of Eth in usd
        // could be 6k_with additional 18 zeros(the wei unit)
        return uint256(answer * 1e10); //
    }

    /*This function using aggregator interface to get the version of this data address*/
    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    /*This function get converted from eth to usd*/
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        //6000_000000000000000000 wei-> 6K * 1e18 wei -> unit price of eth in USD in unit of wei
        //1 eth -> 1_000000000000000000 wei -> 1*1e18 wei

        uint256 ethAmountInUSD =  (ethPrice * ethAmount) / (1e18);

        return ethAmountInUSD;
    }
}