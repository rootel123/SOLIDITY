// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/* 
위 문제의 확장버전입니다. 
owner와 sub_owner를 설정하고 owner를 바꾸기 위해서는 둘의 동의가 모두 필요하게 구현하세요.
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