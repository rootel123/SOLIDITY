// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요.

contract Q25 {
    uint[] numbers;

    // i가 -1까지 가기때문 이 함수는 실행 안됨
    function pushNumbers(uint _n) public returns(uint[] memory) {
        for(uint i=_n; i>=0; i--) {
            numbers.push(i);
        }
        return numbers;
    }

    // 위 함수 해결 방법 1 & uint 배열이 아닌 int 배열로 해결할 수 있음 
    function pushNumbers1_2(uint _n) public returns(uint[] memory) {
        for(uint i=_n+1; i>=1; i--) {
            numbers.push(i-1);
        }
        return numbers;
    }

    // 위 함수 해결 방법 2
    function pushNumber1_3(uint _n) public returns(uint[] memory) {
        for(uint i=_n; i>=0; i--) {
            numbers.push(i);
            if(i==0) {
                break;
            }
        }
        return numbers;
    }

    function pushNumbers2(uint _n) public returns(uint[] memory) {
        for(uint i=0; i<=_n; i++) {
            numbers.push(_n-i);
        }
        return numbers;
    }
}