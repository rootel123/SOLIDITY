// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

//현재시간을 받고 2일 후의 시간을 설정하는 함수를 같이 구현하세요.

contract Q59 {

    function getCurrentTime() public view returns(uint){
        return block.timestamp;
    }
    
    function twoDayslater()public view returns(uint){
        return block.timestamp + 2 days;
    }
}