// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Counter{

    //public varaible count
    uint public count;

    //public function increment, on call increment the value of count by one
    function increment() public{
        count += 1;
    }

    //public function decrement, on call decrement the value of count by one
    function decrement() public{
        count -= 1;
    }
}