// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

//숫자만 들어가는 배열을 선언하고 숫자를 넣는 함수를 구현하세요.
// 15개의 숫자가 들어가면 3의 배수 위치에 있는
// 숫자들을 초기화 시키는(3번째, 6번째, 9번째 등등) 함수를 구현하세요.
// (for 문 응용 → 약간 까다로움)

contract Q20 {
    uint[] numbers;

    function pushNumber(uint _n) public {
        numbers.push(_n);

        if(numbers.length==15) {
            for(uint i=3; i<numbers.length+1; i+=3) {
                delete numbers[i-1];
            }
        }
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }
}