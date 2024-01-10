// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
여러분은 검색 엔진 사이트에서 근무하고 있습니다. 고객들의 ID와 비밀번호를 안전하게 관리할 의무가 있습니다. 
따라서 비밀번호를 rawdata(있는 그대로) 형태로 관리하면 안됩니다. 
비밀번호를 안전하게 관리하고 로그인을 정확하게 할 수 있는 기능을 구현하세요.

아이디와 비밀번호는 서로 쌍으로 관리됩니다. 
비밀번호는 rawdata가 아닌 암호화 데이터로 관리되어야 합니다.
(string => bytes32)인 mapping으로 관리

value인 bytes32는 ID와 P은W를 같이 넣 후 나온 결과값으로 설정하기
abi.encodePacked() 사용하기

* 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
* 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
---------------------------------------------------------------------------
* 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
* 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
* 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제 
*/

contract TEST {
    mapping(string => bytes32) users;
    mapping(string => uint) Trial;

    function getHash(string memory Id, string memory Pw) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(Id, Pw));
    }
    // * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    function signin(string memory Id, string memory Pw) public {
        // * 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
        require(users[Id] == bytes32(0), "User already exists");
        users[Id] = getHash(Id, Pw);
    }
    // * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    function login(string memory Id, string memory Pw) public returns(bool) {
        //* 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
        require(users[Id] != bytes32(0) && Trial[Id] < 5, "ask for new passward");
        if(users[Id] == getHash(Id, Pw)) {
            Trial[Id] = 0;
            return true;
        }   else {
            Trial[Id]++;
            return false;
        }
    }
    // * 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제
    function deleteId(string memory Id, string memory Pw) public {
        require(users[Id] == getHash(Id,Pw), "go back");
        delete users[Id];
    }
}

contract TEST2 {
    struct User {
        bytes32 hash;
        uint attempts;
        bool isLogin;
        address addr;
    }
    mapping(string => User) users;

    function getHash(string memory Id, string memory Pw) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(Id, Pw));
    }

    // * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    function signin(string memory Id, string memory Pw) public {
        // * 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
        require(users[Id].hash == bytes32(0), "User already exists");
        users[Id].hash = getHash(Id, Pw);
        users[Id].addr = msg.sender;
    }

    // * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    function login(string memory Id, string memory Pw) public returns(bool) {
        //* 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
        require(users[Id].addr == msg.sender && users[Id].isLogin == false && users[Id].attempts < 5, "ask for new passward");
        if(users[Id].hash == getHash(Id, Pw)) {
            users[Id].attempts = 0;
            users[Id].isLogin = true;
            return true;
        }   else {
            users[Id].attempts++;
            return false;
        }
    }

    function logout(string memory Id) public {
        require(users[Id].addr == msg.sender && users[Id].isLogin == true, "LogOut");
        users[Id].isLogin = false;
    }

    // * 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제
    function deleteId(string memory Id, string memory Pw) public {
        require(users[Id].addr == msg.sender && users[Id].isLogin == true && users[Id].hash == getHash(Id,Pw), "go back");
        delete users[Id];
    }
}