// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 10. 숫자 3개가 부여되면 그 3개의 숫자를 이어붙여서 반환하는 함수를 구현하세요. 
// 예) 3,1,6 → 316 // 1,9,3 → 193 // 0,1,5 → 15 
// 응용 문제 : 3개 아닌 n개의 숫자 이어붙이기

contract Q50 {
    function getNum(uint _x, uint _y, uint _z) public pure returns(uint) {
        uint _num;
        _num = _x * 100 + _y * 10 + _z;

        return _num;
    }

    function getDigits(uint _n) public pure returns(uint) {     // 자릿수 받아오는 함수
        if(_n==0) {
            return 1;
        }

        uint _m;
        while(_n != 0) {
            _m++;
            _n/=10;
        }
        return _m;
    }

    function getNum2(uint _x, uint _y, uint _z) public pure returns(uint) {
        uint c_dig = getDigits(_z);
        uint b_dig = getDigits(_y);

        return _x*10**(b_dig + c_dig) + _y*10**(c_dig) + _z;
    }
}