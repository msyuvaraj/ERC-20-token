// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {console , Script} from "forge-std/Script.sol";


contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken" , "OT"){
        _mint(msg.sender , initialSupply); //sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 add 0x5FbDB2315678afecb367f032d93F642f64180aa3
        ///
    }
}