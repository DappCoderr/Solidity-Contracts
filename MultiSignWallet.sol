//SPDX-License-Identifier:MIT

pragma solidity ^0.8.5;

contract MultiSignWallet {

    event Deposit(address indexed sender, uint value);
    event Submit(uint indexed txID);

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public required;

    Transaction[] public transactions;

    modifier onlyOwner {
        require(isOwner[msg.sender], "User is not Owner");
        _;
    }

    mapping(uint => mapping(address => bool)) public approve;

    constructor(address[] memory _owners, uint _require){
        require(_owners.length > 0, "owner required");
        require(_require > 0 && _require <= _owners.length, "invalid number of owners");

        for(uint i = 0; i < _owners.length; i++){
            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);

        }

        required = _require;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function submit(address _to, uint _value, bytes calldata _data) external onlyOwner {
        transactions.push(Transaction({
            to: _to,
            value: _value,
            data: _data,
            executed: false
        }));
        emit Submit(transactions.length - 1);
    }
}