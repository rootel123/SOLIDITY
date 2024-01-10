// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/*
위 문제의 또다른 버전입니다. 
owner가 변경할 때는 바로 변경가능하게 sub-owner가 변경하려고 한다면 owner의 동의가 필요하게 구현하세요.
*/

contract Q56 {
    address owner;
    address sub_owner;

    bool[2] isAgreed;

    constructor(address _addr) {
        owner = msg.sender;
        sub_owner = _addr;
    }

    function Agreement(bool _b) public {
        require(msg.sender == owner || msg.sender == sub_owner);

        if(msg.sender == owner) {
            isAgreed[0] = _b;
        } else {
            isAgreed[1] = _b;
        }
    }

    function changeOwner(address new_owner) public {
        require(msg.sender == owner && isAgreed[0] == true && isAgreed[1] == true);
        owner = new_owner;
    }

    function changeSubOwner(address new_owner) public {
        require(msg.sender == owner && isAgreed[0] == true);
        owner = new_owner;
    }
}