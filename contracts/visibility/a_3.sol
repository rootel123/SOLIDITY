// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY_Variable {
    uint a = 1;
    uint private b = 2;
    uint internal c = 3;
    uint public d = 4;

    uint[] numbers1;
    uint[] private numbers2;
    uint[] internal numbers3;
    uint[] public numbers4;

    mapping(uint => string) mapping1;
    mapping(uint => string) private mapping2;
    mapping(uint => string) internal mapping3;
    mapping(uint => string) public mapping4;

    struct A {
        uint a;
        string b;
    }

    A a_1;
    A private a_2;
    A internal a_3;
    A public a_4;

    function set1(uint[] memory _n) public {
        numbers1 = _n;
    }

    function set2(uint[] memory _n) public {
        numbers2 = _n;
    }

    function set3(uint[] memory _n) public {
        numbers3 = _n;
    }

    function set4(uint[] memory _n) public {
        numbers4 = _n;
    }

    function setm1(uint _n, string memory _s) public {
        mapping1[_n]= _s;
    }

    function setm2(uint _n, string memory _s) public {
        mapping2[_n]= _s;
    }

    function setm3(uint _n, string memory _s) public {
        mapping3[_n]= _s;
    }

    function setm4(uint _n, string memory _s) public {
        mapping4[_n]= _s;
    }

    function getABCD() public view returns(uint, uint, uint, uint) {
        return (a, b, c, d);
    }

    function setA_1() public {
        a = 10;
    }

    function setA_2() external {
        a = 20;
    }

    function setA_3() internal {
        a = 30;
    }

    function setA_4() private {
        a = 40;
    }

    function setB_1() public {
        b = 10;
    }

    function setB_2() external {
        b = 20;
    }

    function setB_3() internal {
        b = 30;
    }

    function setB_4() private {
        b = 40;
    }
}

contract DAD {
    uint public a;
    uint[] public b;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }

}

contract MOM {
    // 서로 다른 2개의 tab 띄운 후에, 새로고침하고 주소 확인해보기
    DAD public husband = new DAD();
    DAD public husband2 = new DAD();

    function getH1a() public view returns(uint) {
        return husband.a();
    }

    function getH1b() public view returns(uint) {
        return husband.b(1);
    }

    function getH2a() public view returns(uint) {
        return husband2.a();
    }

    function getH2b() public view returns(uint) {
        return husband2.b(1);
    }

    /*
    function getAddress() public view returns(address) {
        return address(this);
    }

    
    h_Address(), h_Address2()와 husband는 같은 주소를 나타냄
    2도 마찬가지
    
    function h_Address() public view returns(address) {
        return address(husband);
    }

    function h_Address2() public view returns(address) {
        return husband.getAddress();
    }

    function h_Address2_1() public view returns(address) {
        return address(husband2);
    }

    function h_Address2_2() public view returns(address) {
        return husband2.getAddress();
    }
    */
}

contract DAD_2 {
    uint public a;
    uint[] public b;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }
}

// 0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c   / 10 / [1,2,3,4,5]
// 0xcD6a42782d230D7c13A74ddec5dD140e55499Df9   / 20 / [2,4,6,8,10]
// 0xaE036c65C649172b43ef7156b009c6221B596B8b   / 30 / [1,3,5,7,9]

contract MOM_2 {
    DAD husband = new DAD();

    function setHusband(address _a) public {
        husband = DAD(_a);
    }

    function getA() public view returns(uint) {
        return husband.a();
    }

    function getB(uint _n) public view returns(uint) {
        return husband.b(_n);
    }
}