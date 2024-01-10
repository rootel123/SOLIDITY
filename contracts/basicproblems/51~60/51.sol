// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 숫자들이 들어가는 배열을 선언하고 그 중에서 3번째로 큰 수를 반환하세요.

contract Q51 {
    uint[] num;

    function Input(uint _n) public {
        num.push(_n);
    }

    function Sort() public view returns(uint){
        uint[] memory _a = num;

        for(uint i=0; i<_a.length; i++){
            for(uint j=i+1; j<num.length; j++){
                if(_a[i]<_a[j]){
                    (_a[i],_a[j]) = (_a[j],_a[i]);
                }
            }
        }

        return _a[2];
    }
}