// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract REVIEW {
    uint a;
    string b;
    bytes c;

    uint[] numbers;
    string[] letters;

    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a + _b + _c;    // + 함수   
    }

    function mul(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a * _b * _c;    // * 함수
    }

    function push_Number(uint _n) public {
        numbers.push(_n);   // array에 number 추가 함수
    }

    function pop_Number() public {
        numbers.pop();      // array에서 number 제거 함수
    }

    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1];   //array에 n번째 숫자 호출 함수
    }

    function setNumber(uint _a, uint _b) public {
        numbers[_a-1] = _b;     //array에서 a를 b로 바꾸는 함수
    }

    function deleteNumber(uint _n) public {
        delete numbers[_n-1];   //array에서 n번째 함수를 삭제 함수
    }

    function getLength() public view returns(uint) {
        return numbers.length;   // array의 길이 확인 함수
    }

    function returnArray() public view returns(uint[] memory) {
        return numbers;     // array의 배열에 있는 전체 함수 호출
    }

    function push_Letters(string memory _str) public {
        letters.push(_str);     // array에 string 추가 함수
    }
}