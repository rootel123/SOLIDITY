// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract QUIZ {
    uint[] numbers;
    uint[] odd;

    function push_Number(uint _n) public {
        numbers.push(_n);
    }

    function returnNumber() public view returns(uint[] memory) {
        return numbers;
    }

    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1];
    }

    function getAverage() public view returns(uint) {
        uint sum;
        
        for(uint i=0; i< numbers.length; i++) {
            sum += numbers[i];
        }

        return sum/numbers.length;
    }

    function getOddsCount() public view returns(uint) {          // 짝수의 갯수를 구하는 함수
        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                index++;
            }
        }

        return index;
    }

    function getOdds() public view returns(uint[10] memory) {   // 구체적인 예시로 10로 만든것임
        //uint[] memory _odd = new uint[](10);                  // => 길이가 10자리인 array를 새로 만드는 것
        uint[10] memory _odd;                                   // _odd의 길이를 10으로 고정 대신 returns도 같이 10으로 고정해야한다.
        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                _odd[index] = numbers[i];
                index++;
            }
        }
        return _odd;
    }

    function getOdds_2() public view returns(uint[] memory) {       // 위에 함수처럼 길이를 10으로 고정하는 것이 아닌
        uint[] memory _odd = new uint[](getOddsCount());            // getOddsCount()의 결과값인 짝수 갯수를 넣는 것이다.
        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                _odd[index] = numbers[i];
                index++;
            }
        }
        return _odd;
    }
}
