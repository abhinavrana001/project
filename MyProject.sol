// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name = "My Token";
    string public symbol = "MTK";
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply;
        balanceOf[msg.sender] = totalSupply;
    }

    function mint(address to, uint256 value) public {
        if (to != address(0) && msg.sender == address(this)) {
            totalSupply += value;
            balanceOf[to] += value;
        }
    }

    function burn(uint256 value) public {
        if (balanceOf[msg.sender] >= value) {
            balanceOf[msg.sender] -= value;
            totalSupply -= value;
        }
    }
}

