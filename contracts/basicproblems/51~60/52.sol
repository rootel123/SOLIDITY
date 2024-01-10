// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 자동으로 아이디를 만들어주는 함수를 구현하세요.
// 이름, 생일, 지갑주소를 기반으로 만든 해시값의 첫 10바이트를 추출하여 아이디로 만드시오.

contract Q52 {
    function setID(string memory _name, uint birthday) public view returns(bytes10) {
        return bytes10(keccak256(abi.encodePacked(_name,birthday, msg.sender)));
    }
}

contract firstTenBytes {
    function hash(uint _n) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_n));
    }

    function firstTen(uint _n) public pure returns(bytes10) {
        return bytes10(keccak256(abi.encodePacked(_n)));
    }
}