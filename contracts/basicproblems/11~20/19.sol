// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 숫자를 넣으면 2배를 반환해주는 함수를 구현하세요.
// 단 숫자는 1000이상 넘으면 함수를 실행시키지 못하게 합니다.

contract Q19 {
    function num(uint number) public pure returns (uint) {
        require(number < 1000, "Number must be less than 1000");
        return number * 2;
    }
}