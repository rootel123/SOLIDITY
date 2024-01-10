// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() virtual public view returns(uint) {
        return a;
    }

    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() public pure returns(string memory) {
        return "David";
    }

    function getZ() external pure returns(uint) {
        return 10;
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "dad from MOM";
    }
}

contract Child is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function getA() override public view returns(uint) {
        return super.getA();
    }

    function getA2() public view returns(uint) {
        return super.getA();
    }

    /*function getZ2() public pure returns(uint) {
        return super.getA();
    }*/
}

contract Child2 is DAD, MOM {       // is 다음 마지막으로 선언된 것이 반영됨
    function who() override(DAD, MOM) public pure returns(string memory) {
        return super.who();     // 결과값 : MOM
    }
}

contract Child3 is DAD, MOM {
    function who() override(MOM, DAD) public pure returns(string memory) {
        return super.who();     // 결과값 : MOM
    }
}

contract Child4 is MOM, DAD {
    function who() override(DAD, MOM) public pure returns(string memory) {
        return super.who();     // 결과값 : DAD
    }
}

contract Child5 is MOM, DAD {
    function who() override(MOM, DAD) public pure returns(string memory) {
        return super.who();     // 결과값 : DAD
    }
}