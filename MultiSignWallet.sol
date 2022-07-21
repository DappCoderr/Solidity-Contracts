//SPDX-License-Identifier:MIT

pragma solidity ^0.8.5;

contract MultiSignWallet {

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
    }

    address[] public owner;
    mapping(address => bool) public isOwner;
    uint public required;

    Transaction[] public transactions;

    mapping(uint => mapping(address => bool)) public approve;

    constructor(address[] memory _owners, uint _require){
        require(_owners.length > 0, "owner required");
        required(_required > 0 && _required <= _owners.length, "invalid number of owners");

        for(uint i = 0; i < _owners.length; i++){
            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);

        }

        required = _require;
    }



}