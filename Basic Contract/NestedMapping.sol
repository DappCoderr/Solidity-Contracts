//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract NestedMapping {

    mapping(address => mapping(uint => bool)) public nested;

    function getValue(address _address, uint _i) public view returns(bool){
        return nested[_address][_i];
    }

    function setValue(address _address, uint _i, bool _b) public {
        nested[_address][_i] = _b;
    }

    function deleteValue(address _address, uint _i) public {
        delete nested[_address][_i];
    }
}