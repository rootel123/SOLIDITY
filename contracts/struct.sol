// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract STRUCT {
    struct Student {           // struct - 구조체
        string name;
        uint number;
        uint score;
        string grade;
    }

    Student a;
    Student b;

    function setA(string memory _name, uint _number, uint _score, string memory _grade) public {
        a = Student(_name, _number, _score, _grade);
    }

    function setB(string memory _name, uint _number, uint _score, string memory _grade) public {
        b = Student(_name, _number, _score, _grade);
    }

    function getA() public view returns(Student memory) {
        return a;
    }

    function getB() public view returns(Student memory) {
        return b;
    }

    Student[] class;

    function pushStudent(string memory _name, uint _number, uint _score, string memory _grade) public {
        class.push(Student(_name, _number, _score, _grade));
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return class[_n-1];
    }

    function getClass() public view returns(Student[] memory) {
        return class;
    }

}

contract STRUCT2 {
    struct Student {           // struct - 구조체
        string name;
        uint number;
        uint score;
        string grade;
    }

    Student[] class;

    function pushStudent(string memory _name, uint _number, uint _score, string memory _grade) public {
        class.push(Student(_name, _number, _score, _grade));
    }

    function pushStudent2(Student memory _s) public {
        class.push(_s);
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return class[_n-1];
    }

    function getClass() public view returns(Student[] memory) {
        return class;
    }

    function getStudentScore(uint _n) public view returns(uint) {
        return class[_n-1].score;
    }

}

contract STRUCT3 {
    struct Student {
        string name;
        uint number;
    }

    Student[] class;

    Student s1;
    Student s2;
    Student s3;

    function setStudent1(string memory _name, uint _number) public {
        s1 = Student(_name, _number);
    }

    function setStudent2(string memory _name, uint _number) public {
        s2.name = _name;
        s2.number = _number;
    }

    function setStudent3(string memory _name, uint _number) public {
        s3 = Student({
            name : _name,
            number : _number
        });
    }

    function getStudent() public view returns(Student memory, Student memory, Student memory) {
        return (s1, s2, s3);
    }
}

contract STRUCT4 {
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;

    Student s1;
    Student s2;
    Student s3;

    function setStudent1(string memory _name, uint _number, string[] memory _classes) public {
        s1 = Student(_name, _number, _classes);     // abc, 1, ["a","b","c"] 형식으로 데이터 기입
    }

    function setStudent2(Student memory _s) public {
        s2 = _s;    // [abc, 1, ["a","b","c"]] 형식으로 데이터 기입
    }

    function setStudent3(string memory _name, uint _number, string[] memory _classes) public {
        s3 = Student({
            name : _name,
            number : _number,
            classes : _classes
        });
    }

    function pushStudent(Student memory _s) public {
        students.push(_s);
    }

    function getStudent() public view returns(Student[] memory) {
        return students;
    }
}