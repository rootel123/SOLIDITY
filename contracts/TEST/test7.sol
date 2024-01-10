// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 
안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
안건들을 모아놓은 자료구조도 구현하세요. 

사용자는 자신의 이름과 주소, 자신이 만든 안건 자그리고 신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한
정보[string => bool]로 이루어져 있습니다.(구조체)

* 사용자 등록 기능 - 사용자를 등록하는 기능
* 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
* 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
* 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환
  // 밑의 심화 문제 풀었다면 상태도 반환)
* 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
-------------------------------------------------------------------------------------------------
* 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경,
  둘 중 하나라도 만족못하면 기각
*/

contract TEST {
    struct Agenda{
        uint number;
        string title;
        string content;
        address _addr;
        uint proponent;
        uint dissenter;
    }

    struct myAgenda{
        uint numer;
        string title;
        string content;
        uint proponent;
        uint dissenters;
    }

    struct Voter {
        string name;
        address voterAddr;
        mapping(string => bool) votes;
    }

    mapping(address => Voter) voters;
    mapping(string => uint) voteTitle;
    mapping(uint => Agenda) Agendas;
    uint voteCount;

    function addVoter(string memory _name) public {
        voters[msg.sender].name = _name;
        voters[msg.sender].voterAddr = msg.sender;
    }

    function Vote(string memory _title, bool _vote) public {
        require(voteTitle[_title] != 0, "go back");
        uint _voteId = voteTitle[_title];
        require(voters[msg.sender].votes[_title] == false, "go back");
        voters[msg.sender].votes[_title] = true;

        if(_vote) {
            Agendas[_voteId].proponent++;
        }else {
            Agendas[_voteId].dissenter++;
        }
    }

    function addAgenda(string memory _title, string memory _contents) public {
        voteCount++;
        Agendas[voteCount] = Agenda(voteCount, _title, _contents, msg.sender, 0, 0);
        voteTitle[_title] = voteCount;
    }

    function checkAgenda() public view returns(myAgenda[] memory) {
        uint myAgendaCount = 0;

        for(uint i = 1; i <= voteCount; i++){
            if(Agendas[i]._addr == msg.sender){
                myAgendaCount++;
            }
        }

        myAgenda[] memory myasd = new myAgenda[](myAgendaCount);

        uint count = 0;

        for(uint i = 1; i <= voteCount; i++){
            if(Agendas[i]._addr == msg.sender){
                myasd[count] = myAgenda(i, Agendas[i].title, Agendas[i].content, Agendas[i].proponent, Agendas[i].dissenter);
                count++;
            }
        }

        return myasd;
    }

    function TotalAgenda(string memory _title) public view returns(Agenda[] memory) {
    }
}

