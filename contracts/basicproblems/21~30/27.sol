// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요.
// 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.

contract Q27 {
    mapping(string => bytes32) info;

    function pushInfo(string memory _s) public {
        info[_s] = keccak256(abi.encodePacked(_s));
    }

    function getInfo(string memory _s) public view returns(bytes32) {
        return info[_s];
    }

    function deleteInfo(string memory _s) public {
        delete info[_s];
    }
}