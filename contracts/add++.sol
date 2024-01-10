// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ADDes {
    //i++
    uint i1;
    function add1() public {
        i1++;
    }

    //i+=1
    uint i2;
    function add2() public {
        i2+=1;
    }

    //i=i+1
    uint i3;
    function add3() public {
        i3 = i3+1;
    }
}

contract RETURN_UINT_OR_STRING {
    function returnUintString(bool isString) public pure returns(bytes memory) {
        if(isString) {
            return abi.encodePacked("String");
        } else {
            uint number = 12345;
            return abi.encodePacked(number);
        }
    }
}