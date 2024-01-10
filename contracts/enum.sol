// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ENUM {     // enum은 열거형이라고 불리며, 서로 연관된 상수들의 집합을 의미
    enum Status {
        TurnedOff,
        Stop,
        Moving
    }

    Status CarStatus;

    function getStatus() public view returns(Status) {
        return CarStatus;
    }

    function turnOn() public {
        CarStatus = Status.Stop;
    }

    function moving() public {
        CarStatus = Status.Moving;
    }
}

contract ENUM2 {
    enum Color {
        white,  // 0
        red,    // 1
        yellow, // 2
        green   // 3
    }

    Color c;

    function gewtColor() public view returns(Color) {
        return c;
    }

    function red() public {
        c = Color.red;
    }

    
    function yellow() public {
        c = Color.yellow;
    }

    
    function green() public {
        c = Color.green;
    }

    function white() public {
        c = Color.white;
    }
}

contract ENUM3 {
    enum Status{
        a,
        b,
        c,
        d,
        f
    }

    Status grade;

    function getGrade() public view returns(Status) {
        return grade;
    }

    function setGrade(uint _n) public {
        if(_n >= 90) {
            grade = Status.a;
        } else if(_n >= 80) {
            grade = Status.b;
        } else if(_n >= 70) {
            grade = Status.c;
        } else if(_n >= 60) {
            grade = Status.d;
        } else {
            grade = Status.f;
        }
    }
}