// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 긴 숫자를 넣었을 때, 마지막 3개의 숫자만 반환하는 함수를 구현하세요.
// 예) 459273 → 273 // 492871 → 871 // 92218 → 218

contract Q49 {
    function lastNum3(uint _n) public pure returns(uint) {
        require(_n>=100, "go back");

        for(;_n>=1000;) {
            _n -= 1000;
        }
        return _n;
    }
}

contract Q49_1 {
    function firstNumber3(uint _n) public pure returns (uint) {
        uint num = _n;
        for (uint i = 0; num >= 1000; i++) {
            num /= 10;
        }
        return num;
    }
}

contract Q49_2 {
    function getDigits(uint _n) public pure returns(uint) {     // 자릿수 받아오는 함수
        uint _m=1;

        while(_n > 10**_m) {
            _m++;
        }
        return _m;
    }

    function firstThree(uint _n) public pure returns(uint) {
       return _n / 10**(getDigits(_n)-3);
    }
}

