// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/* 
기부받는 플랫폼을 만드세요. 
가장 많이 기부하는 사람을 나타내는 변수와 그 변수를 지속적으로 바꿔주는 함수를 만드세요.
*/
contract Q54 {
    address public honorable_donor;
    uint public highest;


    function donation() public payable {
        if(msg.value > highest) {
            highest = msg.value;
            honorable_donor = msg.sender;
        }
    }
}