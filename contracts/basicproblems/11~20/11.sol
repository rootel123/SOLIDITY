// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// uint 형이 들어가는 array를 선언하고,
// 짝수만 들어갈 수 있게 걸러주는 함수를 구현하세요

contract Q11 {
    uint[] even;

    function evenNumbers(uint _n) public {
        if(_n%2==0){
            even.push(_n);
        }
    }
}