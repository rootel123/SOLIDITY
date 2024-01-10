// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// string을 input으로 받는 함수를 구현하세요.
// 이 함수는 true 혹은 false를 반환하는데 Bob이라는 이름이 들어왔을 때에만 true를 반환합니다. 

contract Q17 {
     function isBob(string memory name) public pure returns (bool) {
        return keccak256(abi.encodePacked((name))) == keccak256(abi.encodePacked(("Bob")));
    }
}