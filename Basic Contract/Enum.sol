//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Enum{

    enum Status {
        Pending,
        Shiped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function getEnum() public view returns(Status) {
        return status;
    }

    function setEnum(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function reset() public {
        delete status;
    }
}
