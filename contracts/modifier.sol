// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER {
    uint a;
    modifier higherThanFive() {     // 같은 조건이 여러번 들어갈 때 사용
        require(a>=5, "go back");
        _;      // 함수의 실행 위치
    }

    function setA(uint _n) public {
        a = _n;
    }

    function A() public view higherThanFive returns(uint) {     // 이 함수가 실행되기 전 higherThanFive를 실행하고 실행된다.
        //require( a >= 5, "go back");
        return a * 5;
    }

    function B() public view higherThanFive returns(uint) {
        //require( a >= 5, "go back");
        return a**2;
    }
}

contract MODIFIER2 {
    uint a;
    uint b;

    modifier mul1(){
        a *= 2;
        _;
    }

    modifier mul2(){
        _;
        b *= 2;
        
    }

    function getAB() public view returns(uint, uint) {
        return (a,b);
    }

    function A() public mul1 {
        a += 7;
    }

    function B() public mul2 {
        b += 7;
    }
}

contract MODIFIER3 {
    uint a = 1;

    uint b;
    uint c;

    modifier mul1() {
        a *= 3;
        _;
    }

    modifier mul2() {
        a += 7;
        _;
    }

    function resetA() public {
        a = 1;
    }

    function setB() public mul1 mul2 {
        b = a;
    }

    function setC() public mul2 mul1 {
        c = a;
    }

    function getBC() public view returns(uint, uint) {
        return (b,c);
    }
}

contract MODIFIER4 {
    uint a;

    modifier plusoneBefore() {
        a++;
        _;
    }

    modifier plusoneAfter() {
        _;
        a++;
    }

    function setA(uint _n) public {
        a = _n;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setA1() public plusoneBefore returns(bool) {
        if(a>=3) {
            return true;
        }else {
            return false;
        }
    }

    function setA2() public plusoneAfter returns(bool) {
        if(a>=3) {
            return true;
        }else {
            return false;
        }
    }
}

contract MODIFIER5 {
    uint mutex = 0;

    function getMutex() public view returns(uint) {
        return mutex;
    }

    modifier m_use {
        mutex++;
        _;
        mutex--;
    }

    modifier m_notZero {
        require(mutex == 0, "go back");
        _;
    }
}