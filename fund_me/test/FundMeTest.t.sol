// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant INITIAL_BALANCE = 10 ether;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, INITIAL_BALANCE);
    }

    function testMinimunUSDIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public view {
        assertEq(fundMe.getVersion(), 4);
    }

    function testFailsFundWithoutEnoughETH() public {
        vm.expectRevert("Not found enough ETH");
        fundMe.fund();
    }

    function testUpdatesFunded() public {
        vm.prank(USER); // The next TX will be sent by the USER
        fundMe.fund{value: SEND_VALUE}();
        uint256 amountFounded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFounded, SEND_VALUE);
    }
}
