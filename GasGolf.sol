//SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.5;

contract GasGolf {

    uint public total;

    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint _total = total;
        uint len = nums.length;

        for(uint i = 0; i < len; i++){
            if(nums[i]%2 == 0 && nums[i] < 99){
                _total += nums[i];
            }
        }
        total = _total;
    }
}