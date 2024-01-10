// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import './b.sol';
import './c.sol';


contract A {
    BB b = new BB();
    CCC c = new CCC();
    CCC2 c2 = new CCC2();

    function add(uint _a, uint _b) public view returns(uint) {
        return b.add(_a, _b);
    }

    function add(uint _a, uint _b, uint _c) public view returns(uint) {
        return b.add(_a, _b, _c);
    }

    function mulitply(uint _a, uint _b) public view returns(uint) {
        return c.mulitply(_a, _b);
    }

    function mulitply(uint _a, uint _b, uint _c) public view returns(uint) {
        return c.mulitply(_a, _b, _c);
    }

    function power(uint _a, uint _b) public view returns(uint) {
        return c2.power(_a, _b);
    }
}