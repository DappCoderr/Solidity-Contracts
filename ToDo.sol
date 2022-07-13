//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TodoContract {

    struct ToDo {
        string task;
        bool completed;
    }

    ToDo[] public todo;

    function createToDo( string calldata _task) public {
        todo.push(ToDo(_task, false));
    }

    function getToDo(uint _i) public view returns(string memory text, bool complete) {
        ToDo storage todos = todo[_i];
        return( todos.task, todos.completed);
    }

    function updateTask(uint _i, string memory _task) public {
        ToDo storage todos = todo[_i];
        todos.task = _task;
    }

    function toggleComplete(uint _i) public {
        ToDo storage todos = todo[_i];
        todos.completed = !todos.completed;
    }
}