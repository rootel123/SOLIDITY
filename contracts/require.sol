// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract REQUIRE {
    uint a;

    function require_1(uint _n) public returns(string memory) {
        a = _n;
        if(a>=0 && a<=2) {
            return "A";
        } else if(a>=3 && a<=5) {
            return "B";
        } else if(a>=6 && a<=8) {
            return "C";
        } else if(a==9 || a==10) {
            return "D";
        } else {
            return "F";
        }
    }

    function require_1_2(uint _n) public returns(string memory) {
        require(_n<=10, "_n should not be higher than 10.");
        a = _n;
        if(a>=0 && a<=2) {
            return "A";
        } else if(a>=3 && a<=5) {
            return "B";
        } else if(a>=6 && a<=8) {
            return "C";
        } else {
            return "D";
        }
    }

}

contract REQUIRE2 {
    function require2_1() public pure returns(uint) {
        uint a = 1;
        bool b;

        require(b, "go back");
        return a;
    }
}

contract REQUIRE3 {
    uint a;

    function setAasFive() public {
        a = 5;
    }

    function getInput(uint _n) public {
        setAasFive();
        require(_n>=10, "go back");
    }

    function getA() public view returns(uint) {
        return a;
    }
}

contract REQUIRE4 {
    bool isTrue;

    function setBOOL(uint _n) public {
        require(_n>=10 && _n%2==0, "go back");
        isTrue = true;
    }

    function getBOOL() public view returns(bool) {
        return isTrue;
    }
}