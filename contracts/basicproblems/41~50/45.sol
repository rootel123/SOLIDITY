// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 숫자만 들어가는 array를 만들되, 100이하의 숫자만 들어갈 수 있게 구현하세요.

contract Q45 {
    uint[] numbers;

    function pushNumbers(uint _n) public {
        require(_n<=100);
        numbers.push(_n);
    }
}