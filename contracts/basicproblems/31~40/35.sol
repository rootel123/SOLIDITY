// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 5. 숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
// 예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]

contract Q35 {
    uint[] numbers;

    function pushNumbers(uint _n) public {
        numbers.push(_n);
    }

    function evenNumbers() public view returns(uint[] memory) {
        uint[] memory _numbers = new uint[](numbers.length/2);
        uint idx;

        for(uint i=0; i<numbers.length; i+=2) {
            _numbers[idx] = numbers[i];
            idx++;
        }
        return _numbers;
    }
}