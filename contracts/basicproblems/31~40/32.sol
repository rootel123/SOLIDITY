// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 2. 3의 배수만 들어갈 수 있는 array를 구현하되, 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
// 예) 3 → o , 9 → o , 15 → o , 30 → x

contract Q32 {
    uint[] numbers;

    function Input(uint _n) public {
        if(_n%3 ==0 && _n%10!=0){
            numbers.push(_n);
        }
    }
}