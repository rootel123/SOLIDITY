// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/* 
배포와 함께 owner를 설정하고 owner를 다른 주소로 바꾸는 것은 오직 owner 스스로만 할 수 있게 하십시오.
*/
contract Q55 {
    address owner;
    constructor(){
        owner = msg.sender;
    }
    function changeOwner(address _owner) public {
        require(msg.sender == owner,"go back");
        owner = _owner;
    }
}