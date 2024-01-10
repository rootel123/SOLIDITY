// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 9. 특정 숫자의 자릿수까지의 2의 배수, 3의 배수,
// 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
// 예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개)
// 100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)

contract Q39 {
    function count(uint number) public pure returns (uint, uint, uint, uint) {
        uint count2 = number / 2; 
        uint count3 = number / 3; 
        uint count5 = number / 5; 
        uint count7 = number / 7; 

        return (count2, count3, count5, count7);
    }
}