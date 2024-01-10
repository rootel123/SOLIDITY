// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    function getAddress() virtual public view returns(address) {
        return address(this);
    }
}

contract MOM {
    DAD husband = new DAD();

    function getAddress() public view returns(address) {
        return address(this);
    }

    function getHusbandAddress() public view returns(address) {
        return husband.getAddress();
    }

    function getHusbandAddress2() public view returns(address) {
        return address(husband);
    }
}

contract CHILD is DAD {
    function getAddress() override public view returns(address) {
        return address(this);
    }

    function fathersAddress() public view returns(address) {
        return super.getAddress();
    }

    function fathersAddress2() public view returns(address) {
        return DAD.getAddress();
    }
    
}

contract Origin {
    function A() public view returns(address) {
        return msg.sender;
    }

    function B() public view returns(address) {
        return tx.origin;
    }
}

contract Outsider {
    Origin public a = new Origin();

    function A() public view returns(address) {
        return a.A();
    }

    function B() public view returns(address) {
        return a.B();
    }
}