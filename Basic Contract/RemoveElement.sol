//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RemoveElement {

    uint[] public array;

    function remove(uint _i) public {
        require(_i < array.length, "Index value out of array");

        for(uint i = _i; i < array.length - 1; i++){
            array[i] = array[i+1];
        }
        array.pop();
    }
}

//---------------------------------------------
// Second Method to implement this

pragma solidity ^0.8.0;

contract RemoveElement {

    uint[] public array;

    function remove(uint _i) public {
        array[_i] = array[array.length - 1];
        array.pop();
    }
}