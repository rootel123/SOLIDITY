// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 아래의 함수를 만드세요.
/*
1~3을 입력하면 입력한 수의 제곱을 반환합니다.
4~6을 입력하면 입력한 수의 2배를 반환합니다.
7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환합니다.
*/

contract Q5 {
    function cal(uint _n) public pure returns(uint) {
         if(_n >= 1 && _n <= 3) {
            return _n**2;
         } else if(_n >= 4 && _n <= 6) {
            return _n*2;
         } else if(_n >= 7 && _n <=9) {
            return _n%3;
         } else {
            return 9999999999999;
         }
    }    
}