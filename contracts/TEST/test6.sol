// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
--------------------------------------------------------------------------------------------
문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
*/

contract TEST {
    function Number(uint _number) public pure returns (uint, uint[] memory) {
        uint numCount = 0;
        uint temp = _number;

        while(temp != 0){
            temp /= 10;
            numCount++;
        }

        uint[] memory num = new uint[](numCount);
        for(uint i = 0; i < numCount; i++){
            num[numCount - 1 - i] = _number % 10;
            _number /= 10;
        }

        return (numCount, num);
    }

    function String(string memory _str) public pure returns (uint, string[] memory) {
        bytes memory strBytes = bytes(_str);
        string[] memory strArr = new string[](strBytes.length);
        
        for(uint i = 0; i < strBytes.length; i++) {
            strArr[i] = string(abi.encodePacked(strBytes[i]));
        }
        
        return (strBytes.length, strArr);
    }
}

contract TEST_explanation{      // 풀이
    function numLength(uint _n) public pure returns(uint) {
        uint len =1;
        while(_n >= 10) {
            _n /= 10;
            len++;
        }
        return len;
    }

    function digitAndSplit(uint _n) public pure returns(uint, uint[] memory) {
        uint[] memory b = new uint[](numLength(_n));
        uint i = numLength(_n);
        uint j = numLength(_n);
        while(_n!=0) {
            b[--i] = _n%10;
            _n = _n/10;
        }

        return (j, b);
    }

    function stringLength(string memory _s) public pure returns(uint) {
        return bytes(_s).length;
    }

    function bytesSplit(bytes memory _bytes) public pure returns(bytes1[] memory) {
        bytes1[] memory _bytes1 = new bytes1[](_bytes.length);
        for(uint i=0; i<_bytes.length; i++) {
            _bytes1[i] = _bytes[i];
        }

        return _bytes1;
    }

    function stringSplit(string memory _string) public pure returns(string[] memory) {
        string[] memory _s = new string[](bytes(_string).length);

        bytes1[] memory _b = new bytes1[](bytes(_string).length);
        _b = bytesSplit(bytes(_string));

        for(uint i =0; i<_s.length; i++) {
            _s[i] = string(abi.encodePacked(_b[i]));
        }

        return _s;
    }

}