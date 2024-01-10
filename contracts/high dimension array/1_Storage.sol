// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract A {
    uint[] [] public double_a;

    function pushNum1(uint _a) public {
        double_a.push([_a]);
    }

    function pushNum2_1(uint _a, uint _b) public {
        double_a.push([_a,_b]);
    }

    function pushNum2_2(uint[] memory _a) public {
        double_a.push(_a);
    }

    function setNum(uint _a, uint _b, uint _c) public {
        double_a[_a][_b] = _c;
    }

    function getLength(uint _a) public view returns(uint) {
        return double_a[_a].length;
    }

    function getLine(uint _a) public view returns(uint[] memory) {
        return double_a[_a];
    }

    function getLength() public view returns(uint) {
        return double_a.length;
    }
}

contract B {
    uint[4][6] public numbers;

    function getLength() public view returns(uint) {
        return numbers.length;
    }

    function pushNumbers(uint[4] memory _a) public {
        numbers[0] = _a;
    }
}

contract C {
    uint[4][] public number1;
    uint[][4] public number2;

    function getLength1() public view returns(uint) {
        return number1.length;
    }

    function push1(uint[4] memory _a) public {
        number1.push(_a);
    }

    function getLength2() public view returns(uint) {
        return number2.length;
    }

    function push2(uint _n, uint[] memory _b) public {
        number2[_n] = _b;
    }
}