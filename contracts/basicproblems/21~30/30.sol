// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
// (sorting 코드 응용 → 약간 까다로움)

contract Q30 {
    function quiz30(uint256[] memory _n) public pure {
        for (uint256 i = 0; i < _n.length; i++) {
            for (uint256 j = i + 1; j < _n.length; j++) {
                if (_n[i] < _n[j]) {
                    (_n[i], _n[j]) = (_n[j], _n[i]);
                }
            }
        }
    }
}
