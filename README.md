# Conditions-to-validate-handle-ExceptionsSure! 
---
# ErrorHandlingContract

This Solidity smart contract demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling and condition enforcement. It includes basic functions for depositing, withdrawing, and resetting a balance, with appropriate error checks.

## Features

- **Deposit**: Add funds to the contract.
- **Withdraw**: Remove funds from the contract.
- **Check Balance**: Ensure the balance is non-negative.
- **Reset**: Reset the balance to zero (only callable by the owner).
- **Demo Revert**: Demonstrate the use of `revert()` with a custom condition.

## Getting Started

These instructions will help you set up and deploy the contract in a development environment.

### Prerequisites

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [Truffle](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache) (or use any Ethereum test network)
- [Remix IDE](https://remix.ethereum.org/) (optional, for quick testing)

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-username/ErrorHandlingContract.git
   cd ErrorHandlingContract
   ```

2. **Install Truffle** (if not already installed):
   ```sh
   npm install -g truffle
   ```

3. **Install local dependencies**:
   ```sh
   npm install
   ```

4. **Start Ganache** (if using Ganache for local development):
   ```sh
   ganache-cli
   ```

### Deployment

1. **Compile the contract**:
   ```sh
   truffle compile
   ```

2. **Migrate the contract**:
   ```sh
   truffle migrate
   ```

3. **Test the contract** (optional):
   ```sh
   truffle test
   ```

## Contract Details

### Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingContract {
    
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
        balance = 100;
    }

    function deposit(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        balance += amount;
    }

    function withdraw(uint256 amount) public {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

    function checkBalance() public view {
        assert(balance >= 0);
    }

    function reset() public {
        if (msg.sender != owner) {
            revert("Only the owner can reset the contract");
        }
        balance = 0;
    }

    function demoRevert(uint256 x) public pure {
        if (x > 10) {
            revert("Input cannot be greater than 10");
        }
    }
}
```

### Functions

- **`deposit(uint256 amount)`**: Deposits the specified `amount` into the contract. Requires the amount to be greater than zero.
- **`withdraw(uint256 amount)`**: Withdraws the specified `amount` from the contract. Requires the amount to be less than or equal to the current balance.
- **`checkBalance()`**: Asserts that the balance is not negative.
- **`reset()`**: Resets the balance to zero. Only the owner can call this function.
- **`demoRevert(uint256 x)`**: Demonstrates the use of `revert()` if the input `x` is greater than 10.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Solidity documentation for comprehensive guides and references.
- OpenZeppelin for standard smart contract libraries.
- Truffle Suite for development tools.
