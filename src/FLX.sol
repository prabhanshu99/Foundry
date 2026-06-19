// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FLX is ERC20 {

    constructor() ERC20("FLXCoin", "FLX") {
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == msg.sender, "Only owner can mint");
        _mint(to, amount);
    }
}