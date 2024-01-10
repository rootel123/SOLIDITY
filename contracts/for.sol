// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FOR {
    function loop1() public pure returns(uint) {
        uint a;

        for(uint i=0; i<10; i++) {
            a += i;     // a = a + i
        }

        return a;
    }

    function loop2() public pure returns(uint, uint) {
        uint a;
        uint i;

        for(i=0; i<5; i++) {
            a += i;     // a = a + i
        }

        return (a,i);
    }

    function loop3() public pure returns(uint) {
        uint a;

        for(uint i=1; i<=100; i++) {
            a +=i;
        }

        return a;
    }

    function loop4() public pure returns(uint) {
        uint a;

        for(uint i=1; i<=100; i+=2) {
            a +=i;
        }

        return a;
    }

    function loop5() public pure returns(uint) {
        uint a;

        for(uint i=1; i<=100; i*=2) {
            a +=i;
        }

        return a;
    }

    uint[] numbers;

    function push(uint a) public {
        numbers.push(a);
    }

    function getArray() public view returns(uint[] memory) {
        return numbers;
    }

    function addTwoAll() public {
        for(uint i=0; i<numbers.length; i++) {
            numbers[i] +=2;
        }
    }

    function addTwoAll2(uint[] memory _numbers) public pure returns(uint[] memory) {
        for(uint i=0; i< _numbers.length; i++) {
            _numbers[i] +=2;
        }

        return _numbers;
    }

    function addTwoAll3() public view returns(uint[] memory) {
        uint[] memory a = numbers;

        for(uint i=0; i<numbers.length; i++) {
            a[i] += 2;
        }

        return a;
    }
}