// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 이름과 번호 그리고 지갑주소를 가진 '고객'이라는 구조체를 선언하세요.
// 새로운 고객 정보를 만들 수 있는 함수도 구현하되 이름의 글자가 최소 5글자가 되게 설정하세요.

contract Q42 {
     struct Customer {
        string name;
        uint num;
        address addr;
    }

    Customer[] customers;

    // string length를 알고 싶다면, bytes(string).length 사용
    function setCustomer(Customer memory _c1) public {
        require(bytes(_c1.name).length == 5, "At least 5 characters of name");
        customers.push(Customer(_c1.name, _c1.num, _c1.addr));
    }

    function getCustomer() public view returns(Customer[] memory) {
        return customers;
    }
}

contract stringLength {     // 1bytes => 16진수 2자리
    function getLength(string memory _s) public pure returns(uint) {
        return bytes(_s).length;
    }

    function getBytes(string memory _s) public pure returns(bytes memory) {
        return bytes(_s);
    }
}