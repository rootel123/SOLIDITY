// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/*
아래의 함수를 만드세요.

1 ~ 10을 입력하면 "A" 반환

11 ~ 20을 입력하면 "B" 반환

21 ~ 30을 입력하면 "C" 반환
*/

contract Q8 {
    function getLetter(uint _n) public pure returns(string memory) {
        if(_n >= 0 && _n <= 10) {
            return "A";
        } else if(_n >= 11 && _n <= 20) {
            return "B";
        } else if(_n >= 21 && _n <= 30) {
            return "C";
        } else{
            return "X";
        }
    }
}