// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr, uint256 _numb) public view returns (bool) {
        return (nested[_addr][_numb]);
    }

    function set(address _addr, uint256 _numb, bool _boo) public {
        nested[_addr][_numb] = _boo;
    }

    function remove(address _addr, uint256 _numb) public {
        delete nested[_addr][_numb];
    }
}