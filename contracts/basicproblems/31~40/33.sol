// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요.
// 고객의 정보를 넣는 함수와 고객의 이름으로 검색하면
// 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.

contract Q33 {
    struct Person {
        string name;
        uint number;
        address addr;
        uint birth;
    }

    mapping(string=>Person) mapPerson;

    function Input(string memory _name, uint _number, address _addr, uint _birth) public {
        mapPerson[_name] = Person(_name,_number,_addr,_birth);
    }
    
    function getPerson(string memory _name) public view returns(Person memory){
        return mapPerson[_name];
    }
}