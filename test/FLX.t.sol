// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {FLX} from "../src/FLX.sol";

contract CounterTest is Test {
    FLX public flx;

    function setUp() public {
        flx = new FLX();
    }

    function testMint() public {
        flx.mint(address(this), 1000);
        assertEq(flx.balanceOf(address(this)), 1000);
        flx.mint(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 100);
        assertEq(
            flx.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD),
            100
        );
    }

    function testTransfer() public {
        flx.mint(address(this), 1000);
        flx.transfer(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 1000);
        assertEq(
            flx.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD),
            1000
        );
    }

    function testApprove() public {
        flx.mint(address(this), 1000);
        flx.approve(0x64098001362D66322562afBC949E7Df030B4310C, 100);
        assertEq(
            flx.allowance(
                address(this),
                0x64098001362D66322562afBC949E7Df030B4310C
            ),
            100
        );

        vm.prank(0x64098001362D66322562afBC949E7Df030B4310C);
        flx.transferFrom(
            address(this),
            0x64098001362D66322562afBC949E7Df030B4310C,
            100
        );
        // only the above function can be accessed by prank
        assertEq(
            flx.balanceOf(0x64098001362D66322562afBC949E7Df030B4310C),
            100
        );
    }

    function test_DealExample() public {
        address account = address(0x123);
        uint256 balance = 10 ether;

        // Set the balance of `account` to `10 ether`
        vm.deal(account, balance);

        // Assert that the balance is set correctly
        assertEq(address(account).balance, balance);
    }

    function test_HoaxExample() public {
        hoax(address(this), 10 ether);
        flx.test{value: 10 ether}();
        assertEq(address(this).balance, 10 ether);
    }

    function test_DealExample() public {
        deal(address(this), 10 ether);
        assertEq(address(this).balance, 10 ether);
    }
}
