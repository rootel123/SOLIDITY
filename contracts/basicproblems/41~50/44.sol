// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// string만 들어가는 array를 만들되, 4글자 이상인 문자열만 들어갈 수 있게 구현하세요.

contract Q44 {
    string[] words;

    function pushString(string memory _s) public {
        require(bytes(_s).length >= 4);
        words.push(_s);
    }
}