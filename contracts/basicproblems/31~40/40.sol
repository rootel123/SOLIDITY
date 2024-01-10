// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 10. 숫자를 임의로 넣었을 때 내림차순으로 정렬하고
// 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요.
// 가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.
// 예) [5,2,4,7,1] -> [1,2,4,5,7], 4 
// [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 
// [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6

contract Q40 {
    function getMedian(uint[] memory _a) public pure returns(uint[] memory) {
        if(_a.length%2==0) {
            return getMedian_Even(_a);
        } else {
            return getMedian_Odd(_a);
        }
    } 

    function getMedian_Odd(uint[] memory _a) public pure returns(uint[] memory){
        _a = sorting(_a);
        uint[] memory b = new uint[](1);
        b[0] = _a[_a.length/2];
        return b;
    }

    function getMedian_Even(uint[] memory _a) public pure returns(uint[] memory) {
        _a = sorting(_a);
        uint[] memory b = new uint[](2);
        (b[0], b[1]) = (_a[_a.length/2-1], _a[_a.length/2]);
        return b;
    }

    function sorting(uint[] memory _a) public pure returns(uint[] memory){
        for(uint j=1; j<_a.length;j++) {
            for(uint i=0; i<j; i++) {
                if(_a[i] < _a[j]) {
                    (_a[i], _a[j]) = (_a[j], _a[i]);
                }
            }
        }
        return _a;
    }
}