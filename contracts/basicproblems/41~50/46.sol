// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 6. 3의 배수이거나 10의 배수이면서 50보다 작은 수만 들어갈 수 있는 array를 구현하세요.
/*
(예 : 15 -> 가능, 3의 배수 // 40 -> 가능, 10의 배수이면서 50보다 작음 66 -> 가능,
3의 배수 // 70 -> 불가능 10의 배수이지만 50보다 큼)
*/

contract Q46 {
    uint[] numbers;

    function pushNumber(uint _n) public {
        require(_n%3==0 || _n%10==0 && _n<50);
        numbers.push(_n);
    }
}