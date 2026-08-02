// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {LockUSDT} from "../src/LockUSDT.sol";

contract TestLockUSDT is Test {
    LockUSDT public lockUSDT;

    function setUp() public {
        lockUSDT = new LockUSDT(0x0000000000000000000000000000000000000000);
    }

    function testDeposit() public {
        lockUSDT.deposit(1000);
        assertEq(lockUSDT.pendingBalances(address(this)), 1000);
    }

    function testWithdraw() public {
        lockUSDT.deposit(1000);
        lockUSDT.withdraw();
        assertEq(lockUSDT.pendingBalances(address(this)), 0);
    }
}   