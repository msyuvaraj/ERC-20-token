// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.19;
import {Test , console} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    uint256 public  constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken(); 
        ourToken = deployer.run(); 

        console.log(msg.sender);//0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38
        console.log(address(deployer));//0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
        console.log(address(ourToken)); //0x90193C961A926261B756D1E5bb255e67ff9498A1

        vm.prank(msg.sender);
        ourToken.transfer(bob , STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE , ourToken.balanceOf(bob));
        console.log(ourToken.balanceOf(msg.sender));
    }

    function testAllowance() public {
        uint256 initialAllowance = 100 ether;

        vm.prank(bob);
        ourToken.approve(alice , initialAllowance);

        uint256 transferAmount = 101 ether;

        vm.prank(alice);
        ourToken.transferFrom(bob,alice,transferAmount);

        console.log(ourToken.balanceOf(alice));
        console.log(ourToken.balanceOf(bob));

        assertEq(ourToken.balanceOf(alice) , transferAmount);
        assertEq(ourToken.balanceOf(bob) , STARTING_BALANCE - transferAmount);
    }
}