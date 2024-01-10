// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 상태변수 a를 "A"로 설정하여 선언하세요.
// 이 변수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요.
// 단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.

contract Q38 {
    address public owner;
    string public a = "A";

    constructor() {
        owner = msg.sender;
    }

    modifier ownerOnly() {
        require(msg.sender == owner);
        _;
    }

    function setB() public ownerOnly {
        a = "B";
    }

    function setC() public ownerOnly {
        a = "C";
    }

    function getA() public view returns(string memory) {
        return a;
    }
}