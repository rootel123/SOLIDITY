// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MAPPING {
    mapping(string => uint) age;

    function set_age(string memory _name, uint _age) public {
        age[_name] = _age;   // mapping 이름 [key] = value;
    }

    function get_age(string memory _name) public view returns(uint) {
        return age[_name];
    }

    function delete_age(string memory _name) public {
        delete age[_name];
    }

    mapping(string => string) gender;

    function set_gender(string memory _name, string memory _gender) public {
        gender[_name] = _gender;
    }

    function get_gender(string memory _name) public view returns(string memory) {
        return gender[_name];
    }

    struct Student {
       // string name;
       uint number;
       uint score;
       string home_address;
    }

    mapping(string => Student) students;

    function set_students(string memory _name, uint _number, uint _score, string memory _home) public {
        students[_name] = Student(_number, _score, _home);
    }

    function getStudent(string memory _name) public view returns(Student memory) {
        return students[_name];
    }

    struct Student1 {           // => 4개보단 3개가 더 싸다 
       //string name;
       uint number;
       uint score;
       string home_address;
    }

    struct Student2 {
       string name;
       uint number;
       uint score;
       string home_address;
    }

    mapping(string => Student1) s1;
    mapping(string => Student2) s2;

    function setStudent1(string memory _name, Student1 memory _s1) public {
        s1[_name] = _s1;
    }

    function setStudent2(string memory _name, Student2 memory _s2) public {
        s2[_name] = _s2;
    }

    mapping(string => mapping(string => uint)) accounts;

    function setAccount(string memory _name, string memory _bank, uint _amount) public {
        accounts[_name][_bank] = _amount;
    }

    function getAccount(string memory _name, string memory _bank) public view returns(uint) {
        return accounts[_name][_bank];
    }

    struct Student3 {
        string name;
        uint number;
    }

    mapping(string => Student) students3;   // 담당 교사 
    mapping(string => Student[]) students4;   // 반 담임 교사

    function setTeacherStudent1(string memory _teacher, Student memory _s1) public {
        students3[_teacher] = _s1;
    }

    function setTeacherStudent2(string memory _teacher, Student memory _s2) public {
        students4[_teacher].push(_s2);
    }

    function getStudents3(string memory _teacher) public view returns(Student memory) {
        return students3[_teacher];
    }

    function getStudents4(string memory _teacher) public view returns(Student[] memory) {
        return students4[_teacher];
    }
}

