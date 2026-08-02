// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LockUSDT {

    address private usdtAddress;

    mapping(address => uint256) private pendingBalances;


    constructor(address _usdtAddress) {
        usdtAddress = _usdtAddress;
    }

    function deposit(uint256 _amount) public {
        require(IERC20(usdtAddress).allowance(msg.sender, address(this)) >= _amount, "Allowance not enough");
        IERC20(usdtAddress).transferFrom(msg.sender, address(this), _amount);
        pendingBalances[msg.sender] += _amount;
    }

    function withdraw() public {
        uint256 amount = pendingBalances[msg.sender];
        require(amount > 0, "No pending balance");
        IERC20(usdtAddress).transfer(msg.sender, amount);
        pendingBalances[msg.sender] = 0;
    }
}