// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.

contract Q24 {
    function isAlice(string memory _name) public pure returns(bool) {
        if(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice"))) {
            return true;
        } else {
            return false;
        }
    }
}