// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요.
// 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.

contract Q34 {
    struct Student {
        string name;
        uint number;
        uint score;
    }

    Student[] students;

    function addStudent(string memory _name, uint _number, uint _score) public {
        students.push(Student(_name, _number, _score));
    }

    function averageScroe() public view returns (uint) {
        uint totalScore = 0;
        for (uint i = 0; i < students.length; i++) {
            totalScore += students[i].score;
        }
        return totalScore / students.length;
    }
}