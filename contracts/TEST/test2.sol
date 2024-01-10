// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/* 
학생 점수관리 프로그램입니다.
여러분은 한 학급을 맡았습니다.
학생은 번호, 이름, 점수로 구성되어 있고(구조체)
가장 점수가 낮은 사람을 집중관리하려고 합니다.

가장 점수가 낮은 사람의 정보를 보여주는 기능,
총 점수 합계, 총 점수 평균을 보여주는 기능,
특정 학생을 반환하는 기능, -> 숫자로 반환
가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array) 
*/

contract TEST {
    struct Student {
        uint number;
        string name;
        uint score;
    }

    Student[] students;

    function addStudent(Student memory _s) public {
        students.push(_s);
    }

    function LowScoreStudent() public view returns(Student memory) {
        Student memory lowStudent = students[0];

        for(uint i=0; i < students.length; i++) {
            if(lowStudent.score > students[i].score) {
                lowStudent = students[i];
            }
        }
        return lowStudent;
    }

    function TotalAddScore() public view returns(uint) {
        uint totalScore = 0;
    
        for(uint i=0; i<students.length; i++) {
            totalScore += students[i].score;
        }
        return totalScore;
    }

    function TotalAverageScore() public view returns(uint) {
        uint _averageScore = TotalAddScore();

        return _averageScore/students.length;
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getAllStudent() public view returns(Student[] memory) {
        return students;
    }
}