//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Array{

    uint[] public array;
    uint[10] public _array;
    uint[] public array1 = [1,2,3];

    function getArrElement(uint _i) public view returns(uint){
        return array[_i];
    }

    function getArr() public view returns(uint[] memory){
        return array;
    }

    function push() public {
        array.push();
    }
    function pop() public {
        array.pop();
    }

    function arrLength() public view returns(uint){
        return array.length;
    }

    function deleteArr() public {
        delete array;
    }
}