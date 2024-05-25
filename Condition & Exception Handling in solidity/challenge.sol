// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingContract {
    
    // State variable to store the owner's address
    address public owner;

    // State variable to store the balance
    uint256 public balance;

    // Constructor to set the owner and initial balance
    constructor() {
        owner = msg.sender;
        balance = 100;
    }

    // Function to deposit funds into the contract
    function deposit(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        balance += amount;
    }

    // Function to withdraw funds from the contract
    function withdraw(uint256 amount) public {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

    // Function to assert the balance is not negative
    function checkBalance() public view {
        assert(balance >= 0);
    }

    // Function to reset the contract (only owner can call)
    function reset() public {
        if (msg.sender != owner) {
            revert("Only the owner can reset the contract");
        }
        balance = 0;
    }

    // Function to demonstrate revert usage with condition
    function demoRevert(uint256 x) public pure {
        if (x > 10) {
            revert("Input cannot be greater than 10");
        }
    }

    function testAll() public {
        //to deposit the amount
        deposit(10);
        //to withdraw
        //withdraw(10);
        //checkBalance();
        //reset();
        //demoRevert(5);
    }
}
