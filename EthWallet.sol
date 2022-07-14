//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract EthWallet {

    address public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getValue() public view returns(uint){
        return address(this).balance;
    }
}