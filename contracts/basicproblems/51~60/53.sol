// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/* 
시중에는 A,B,C,D,E 5개의 은행이 있습니다. 
각 은행에 고객들은 마음대로 입금하고 인출할 수 있습니다. 
각 은행에 예치된 금액 확인, 입금과 인출할 수 있는 기능을 구현하세요.

힌트 : 이중 mapping을 꼭 이용하세요.
*/
contract TOSS {
    // mapping(address => mapping(address =>uint)) public total_balance;
    address[] banks;

    function pushBanks(address _addr) public {
        banks.push(_addr);
    }

    function totalBalance() public view returns(uint) {
        uint sum;

        for(uint i=0; i<banks.length; i++) {
            Bank b;
            b = Bank(payable(banks[i]));
            sum += b.balanceCheck2();
        }

        return sum;
    }

    function totalBalance2() public view returns(uint[] memory) {
        uint[] memory sum = new uint[](banks.length);

        for(uint i=0; i<banks.length; i++) {
            Bank b;
            b = Bank(payable(banks[i]));
            sum[i] = b.balanceCheck2();
        }

        return sum;
    }

    function deposit(address payable _bank) public payable {
        Bank b;
        b = Bank(_bank);
        payable(b).transfer(msg.value);
        b.deposit2(msg.value);
    }

    function getBalance(address payable _bank) public view returns(uint) {
        Bank b;
        b = Bank(_bank);
        return b.balanceCheck2();
    }
}

contract Bank {
    mapping(address => uint) public user_balance;
    receive() external payable {}

    function deposit() public payable {
        user_balance[msg.sender] += msg.value;
    }

    function deposit2(uint _n) external {
        // require toss 만 or white list 안에 있는 애들만
        user_balance[tx.origin] += _n;
    }

    function withdraw(uint _n) internal {
        require(user_balance[msg.sender] >= _n);
        user_balance[msg.sender] -= _n;
        payable(msg.sender).transfer(_n);
    }

    function balanceCheck() public view returns(uint) {
        return user_balance[msg.sender];
    }

    function balanceCheck2() public view returns(uint) {
        return user_balance[tx.origin];
    }
}