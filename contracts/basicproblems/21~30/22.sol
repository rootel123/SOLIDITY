// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
// 2,5 input → 5-2=3(output)

contract Q22 {
    function sub(uint _a, uint _b) public pure returns(uint) {
        if(_a>=_b) {
            return _a-_b;
        } else {
            return _b-_a;
        }
    }
}