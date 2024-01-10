// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;


contract HASH {
    function kec(string memory _a) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_a));
    }

    function kec2(string memory _a, string memory _b) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }
}

contract sorting {
    uint[] numbers;
    uint lowest=2**256-1;

    function pushNumber(uint _n) public {
        numbers.push(_n);
        setLowest(_n);
    }

    function setLowest(uint _n) public {
        if(lowest > _n) {
            lowest = _n;
        }
    }

    function getLowest() public view returns(uint) {
        return lowest;
    }

    function returnNumbers() public view returns(uint[] memory) {
        return numbers;
    }
}