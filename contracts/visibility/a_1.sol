// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY {
    uint a =5;
    uint b =7;
    uint c =9;
    uint d =11;

    function privateF() private view returns(uint) {
        return a;
    }

    function testPrivateF() public view returns(uint) {
        return privateF();
    }

    function internalF() internal view returns(uint) {
        return b;
    }

    function testInternalF() public view returns(uint) {
        return internalF();
    }

    function publicF() public view returns(uint) {
        return c;
    }

    function externalF() external view returns(uint) {
        return d;
    }

    function setA(uint _a) public {
        a = _a;
    }

    function setB(uint _b) public {
        b = _b;
    }

    function setC(uint _c) public {
        c = _c;
    }

    function setD(uint _d) public {
        d = _d;
    }
}

contract Childs is VISIBILITY {
    /*
    function public_C() public pure returns(string memory) {
        return "public";
    }

    function internal_C() public pure returns(string memory) {
        return internalF();
    }
    */

    function internal_C() public view returns(uint) {
        return internalF();
    }

    function public_C() public view returns(uint) {
        return publicF();
    }

    function private_C() public view returns(uint) {
        return testPrivateF();
    }
}

contract Outsider {
    
    VISIBILITY vs = new VISIBILITY();

    function publicF_o() public view returns(uint) {
        return vs.publicF();
    }

    function externalF_o() public view returns(uint) {
        return vs.externalF();
    }
    
}

contract DAD {
    function dad() virtual public pure returns(string memory) {
        return "dad";
    }
}

contract MOM {
    function mom() public pure returns(string memory) {
        return "mom";
    }
}

contract Child is DAD, MOM {    // 다중 상속
    function child() public pure returns(string memory) {
        return "child";
    }

    function dad() override public pure returns(string memory) {
        return "dad from CHILD";
    }
}

contract grandChild is Child {
    function grandchild() public pure returns(string memory) {
        return "grand child";
    }
}

contract DAD_2 {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() virtual public pure returns(string memory) {
        return "David";
    }
}

contract MOM_2 {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract Child_2 is DAD_2, MOM_2{
    function who() virtual override(DAD_2, MOM_2) public pure returns(string memory) {
        return super.who();
    }
}

contract GrandChild is Child_2 {
    function who() override public pure returns(string memory) {
        return super.who();
    }

    function name() override public pure returns(string memory) {
        return super.name();
    }
}
