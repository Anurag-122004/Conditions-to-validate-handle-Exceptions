// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionContract {
    address public ownerOnly;
    mapping(address => uint256) public balanceofAccount;

    constructor() {
        ownerOnly = msg.sender;
    }

    function sTokens(address _to, uint256 _AMOUNT) public {
        require(msg.sender == ownerOnly, "Only the owner can send tokens.");
        require(balanceofAccount[msg.sender] >= _AMOUNT, "Insufficient balance.");
        require(_AMOUNT > 0, "Amount must be greater than zero.");
        assert(balanceofAccount[_to] + _AMOUNT >= balanceofAccount[_to]);
        balanceofAccount[msg.sender] -= _AMOUNT;
        balanceofAccount[_to] += _AMOUNT;
    }

    function depositingtheAmount() public payable {
        balanceofAccount[msg.sender] += msg.value;
    }

    function withdrawingofAmount(uint256 _AMOUNT) public {
        require(balanceofAccount[msg.sender] >= _AMOUNT, "Insufficient balance to withdraw."); 
        (bool sent, ) = msg.sender.call{value: _AMOUNT}("");
        require(sent, "Failed to send Ether");
        balanceofAccount[msg.sender] -= _AMOUNT;
    }

    function emergencyWithdraw() public {
        if (msg.sender != ownerOnly) {
            revert("Only the owner can perform emergency withdrawal.");
        }
        (bool sent, ) = ownerOnly.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
        balanceofAccount[ownerOnly] = 0;
    }
    receive() external payable {}
    fallback() external payable {}
}
