// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Counter.sol";

contract TestCounter is Test {
    Counter c;

    function setUp() public {
        c = new Counter(100);
    }

    function testIncrement() public {
        c.increment();
        assertEq(c.num(), 101);
    }

    function testDecrement() public {
        c.decrement();
        assertEq(c.num(), 99);
    }
}
