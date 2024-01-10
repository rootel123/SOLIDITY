// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 숫자만 들어갈 수 있으며 길이가 4인 배열을 (상태변수로)선언하고 그 배열에 숫자를 넣는 함수를 구현하세요.
// 배열을 초기화하는 함수도 구현하세요.
// (길이가 4가 되면 자동으로 초기화하는 기능은 굳이 구현하지 않아도 됩니다.)

contract Q41 {
    uint[4] numbers;
    uint idx;

    function pushNumber(uint _n) public {
        if(idx%4==0) {
            initNumbers();
        }

        numbers[idx] = _n;
        idx++;
    }

    function initNumbers() public {
        delete numbers;
        idx = 0;
    }
}

contract Q41_2 {
    uint[4] numbers;
    uint idx;

    function pushNumber(uint _n) public {
        if(idx%4==0) {
            initNumbers();
        }

        numbers[idx%4] = _n;
        idx++;
    }

    function initNumbers() public {
        delete numbers;
    }
}

contract Q41_3 {
    uint[4] num4;

    function setNum4(uint _n) public {
        uint i;
        for(i=0; i < num4.length; i++){
            if(num4[i] == 0){
                num4[i] = _n;
                break;
            }
        }

        if(i == 4) {
            initNum4();
            num4[0] = _n;
        }
    }

    function initNum4() public {
        for(uint i=0; i < num4.length; i++){
            delete num4[i];
        }
    }
}