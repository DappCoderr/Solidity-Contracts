//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Whitelisting {

    uint public whitelistedCount = 0;

    uint public maxAddressGetWhitelisted;

    constructor(uint _maxNumber){
        maxAddressGetWhitelisted = _maxNumber;
    }

    mapping(address => bool) public whitelisedAdd;

    function whitelistAddress(address _addr) public {
        require(!whitelisedAdd[_addr], "already whitelisted");
        require( maxAddressGetWhitelisted >= whitelistedCount, "Limit Reach");
        whitelisedAdd[_addr] = true;
        whitelistedCount += 1;
    }

    function checkWhiteListAddress(address _addr) public view returns(bool) {
        return whitelisedAdd[_addr];
    }

    function getTotalWhitelistedAddress() public view returns(uint){
        return whitelistedCount;
    }
}