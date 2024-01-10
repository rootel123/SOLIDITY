// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BLOCK {
    uint time;

    function getCurrentTime() public view returns(uint) {
        return block.timestamp;
    }

    function getTime() public view returns(uint) {
        return block.timestamp + 100;
    }

    function getTime2() public view returns(uint, uint) {
        return (block.timestamp + 10 seconds, block.timestamp + 10 minutes);
    }

    function getTime3() public view returns(uint, uint, uint) {
        return (block.timestamp + 1 hours, block.timestamp + 1 days, block.timestamp + 1 weeks);
    }

    function lockTime() public {
        time = block.timestamp;
    }

    function A() public view returns(bool) {
        if(block.timestamp <= time + 20) {
            return true;
        } else {
            return false;
        }
    }
}

contract BLOCK2 {
    function getBlockNumber() public view returns(uint) {
        return block.number;
    }

    function getBlockHash(uint _n) public view returns(bytes32) {
        return blockhash(_n-1);
    }

    function getLastBlockHash() public view returns(bytes32) {
        return blockhash(getBlockNumber()-1);
    }
}