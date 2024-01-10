// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ADDRESS {
    address a;

    function setAddress(address _a) public {
        a = _a;
    }

    function getAddress() public view returns(address) {
        return a;
    }
}

contract ADDRESS_Payable {
    address a;
    address payable b;

    function setA() public {
        a = msg.sender;
    }

    function setB() public {
        b = payable(msg.sender);
    }
    
    function deposit() public payable {

    }

    function sendToB() public {
        b.transfer(10 ether);
    }

    function getAB() public view returns(address, address payable) {
        return (a,b);
    }
}

contract MSG {
    function getMSG() public view returns(address) {
        return msg.sender;
    }
}

contract ADDRESS_This_Balance {
    address a;

    function deposit() public payable {}

    function setA() public {
        a = msg.sender;
    }

    function getBalance() public view returns(uint) {
        return a.balance;   // a의 지갑 잔고
    }

    function getBalance2() public view returns(uint) {
        return address(this).balance;   // smart contract 잔고
    }

    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract ADDRESS_CONSTRUCTOR {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function withdraw_1() public {
        owner.transfer(1 ether);
    }

    function withdraw_all() public {
        owner.transfer(address(this).balance);
    }
}

contract ADDRESS_CONSTRUCTOR2 {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    function add2(uint _a) public view returns(uint) {
        return _a+a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function deposit() public payable {}

    function withdraw_1() public {
        owner.transfer(1 ether);
    }

    function withdraw_all() public {
        owner.transfer(address(this).balance);
    }
}