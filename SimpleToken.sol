//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Showcasing simple deposite and withdraw from the crypto account
// Use the usecase of error in solidity
// using required
// using revert - it gives an error when we certain conditions are not met
// using assert - assert is a condition that never can be falsed
contract SimpleToken {
    
    uint public balance;

    function deposit(uint amount) public {
        uint oldbalance = balance;
        uint newbalance = balance + amount;
        require(newbalance >= oldbalance, "OverFlow");
        balance = newbalance;
        assert(balance >= oldbalance);
    }

    function withdraw(uint _amount) public {
        uint oldbalance = balance;
        require(balance >= _amount, "Underflow");

        if(balance < _amount){
            revert("Underflow");
        }
        balance -= _amount;
        assert(balance <= oldbalance);
    }
}