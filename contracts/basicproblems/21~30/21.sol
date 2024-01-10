// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 3의 배수만 들어갈 수 있는 array를 구현하세요.

contract Q21 {
    uint[] numbers;

    function pushNumber(uint _n) public {
        if(_n%3==0) {
            numbers.push(_n);
        }
    }
}

contract Q21_2 {
    uint[] numbers;

    function pushNumber(uint _n) public {
        require(_n%3==0, "go back");
        numbers.push(_n);
    }
}