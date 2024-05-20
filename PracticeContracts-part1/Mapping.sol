// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Mapping {
    /*
    Maps are created with the syntax mapping(keyType => valueType).

    The keyType can be any built-in value type, bytes, string, or any contract.

    valueType can be any type including another mapping or an array.

    Mappings are not iterable.
    */

    // create a public mapping object that take an address and returns uint256, called testMap
    mapping(address => uint256) public testMap; 

    /*
    The difference between view and pure is that view declares that 
    a function can read from the blockchain but cannot modify the state of the contract,
     while pure declares that a function cannot read from the blockchain
    or modify the state of the contract.

    Here, if the function declared as pure, but the return expression 
    (potentially) reads from the environment(blockchain) or state and thus requires "view".

    */
    function get(address _addr) public view returns (uint256) {
        return testMap[_addr]; // read from state
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
    }

    function set(address _addr, uint256 _numb) public {
        // Update the value at this address
        testMap[_addr] = _numb;
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete testMap[_addr];
    }

}