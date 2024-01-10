// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract IF {
    function grade(uint _score) public pure returns(string memory) {
        if(_score>=90) {
            return "A";
        } else if(_score>=80) {
            return "B";
        } else if(_score>=70) {
            return "C";
        } else {
            return "F";
        }
    }

    function divide(uint _number) public pure returns(string memory) {
        if(_number%2==0) {
            return "A";
        } else if(_number%3==0) {
            return "B";
        } else if(_number%5==0) {
            return "C";
        } else {
            return "D";
        }
    }

    function divide2(uint _number) public pure returns(string memory) {
        if( _number>= 20 && _number<=40) {
            if (_number %2 == 0) {
                return "b";
            } else {
                return "c";
            }
        } else if(_number % 2 != 0) {
            return "a";
        } else {
        return "d";
        }
    } 

}