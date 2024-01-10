// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
자동차를 운전하려고 합니다.
자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.

정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 

* 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음,
  70이상(속도)이면 악셀 기능은 더이상 못씀
* 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
* 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
* 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
* 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨

지불은 smart contract에게 함.
----------------------------------------------------------------------------------------
* 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨), 주유소 사장님이 withdraw하는 기능
* 지불을 미리 하고 주유시 차감하는 기능
*/

contract TEST {     // 내가 한 방법
    enum Status {
        stop,
        driving,
        turnoff,
        notfuel
    }

    Status Carstatus;
    uint speed;
    uint fuel;

    constructor() {
        Carstatus = Status.stop;
        speed = 0;
        fuel = 60;

    }

    function StartDriving() public {
        if(Carstatus == Status.stop) {
            Carstatus = Status.driving;
            speed +=1;
            fuel -=2;
        } else if(Carstatus == Status.driving) {
            speed +=1;
            fuel -=2;

            if(fuel < 30) {
                Carstatus = Status.notfuel;
            }

            if(speed > 70) {
                Carstatus = Status.turnoff;
            }

        }
    }

    function BreakDriving() public {
        speed -=1;
        fuel -=1;

    }

    function Turnoff() public {
        require(speed == 0, "Turn off");
        speed = 0;
    }

    function Turnon() public {
         Carstatus = Status.stop;
    }

    address a;
    address payable b;

    function Oiling() public {
        a = msg.sender;
    }


    function asd() public view returns(uint, uint) {
        return (speed, fuel);
    }

}

contract TEST2 {    // 풀이
    enum CarStatus {
        stop,
        off,
        driving,
        outFuel
    }

    struct car {
        CarStatus status;
        uint speed;
        uint fuel;
    }

    address payable owner;

    constructor() {
        owner = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    }

    car mycar;
    uint paid;

    // * 악셀 기능 - 속도를 10 올리는 기능, 악셀 기능을 이용할 때마다 연료가 20씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음
    // 70이상(속도)이면 악셀 기능은 더이상 못씀
    function accel() public {
        require(mycar.speed < 70 && mycar.fuel > 30, "go back");
        require(mycar.status == CarStatus.driving || mycar.status == CarStatus.stop, "go back");
        if(mycar.status != CarStatus.driving) {
            mycar.status = CarStatus.driving;
        }
        mycar.speed += 10;
        mycar.fuel -= 20;
    }

    // * 브레이크 기능 - 속도를 10 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 10씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function Break() public {
        require(mycar.status == CarStatus.driving, "go back");
        mycar.speed -= 10;
        mycar.fuel -= 10;

        if(mycar.speed == 0) {
            mycar.status = CarStatus.stop;
        }
    }

    // * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function turnOff() public {
        require(mycar.speed == 0 || mycar.status == CarStatus.stop, "go back");
        mycar.status = CarStatus.off;
    }

    // * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function turnOn() public {
        require(mycar.status == CarStatus.off, "go back");
        mycar.status = CarStatus.stop;
    }

    // * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    function oiling() public payable {
        require((paid >= 1 ether || msg.value == 1 ether) && mycar.status == CarStatus.stop, "go back");
        if(msg.value != 1 ether) {
            paid -= 1 ether;
        }
        mycar.fuel = 100;
    }

    // * 지불을 미리 하고 주유시 차감하는 기능
    // 충전기능
    function deposit() public payable {
        require(msg.value == 1 ether, "go back");
        paid += msg.value;
    }

    // * 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨), 주유소 사장님이 withdraw하는 기능
    function withdraw() public {
        owner.transfer(address(this).balance);
    }
}