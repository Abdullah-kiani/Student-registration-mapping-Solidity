// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract StudentRegistration {
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyowner {
        require(msg.sender == owner , "you are not the owner");
        _;
    }

    struct studentInfo {
        string name;
        string birthdate;
        string department;
        string _address;
        string email;
        uint mobile_no;
        uint semester;
        uint CGPA;
        string university;
    }

    mapping(uint => studentInfo) students;
    uint[] public studentIds;
    function setStudentRecord(string memory name, string memory birthdate, string memory department, string memory _address, string memory email, uint id, uint mobile_no, uint semester, uint CGPA, string memory university) public {

        studentInfo memory newStudent = students[id];
        newStudent.name = name;
        newStudent.birthdate = birthdate;
        newStudent.department = department;
        newStudent._address = _address;
        newStudent.email = email;
        newStudent.mobile_no = mobile_no;
        newStudent.semester= semester;
        newStudent.CGPA= CGPA;
        newStudent.university= university;
        studentIds.push(id);
    }
    
    function getStudentRecord(uint id) public onlyowner view returns (string memory, string memory, string memory, string memory, string memory, uint, uint, uint, string memory){
        studentInfo memory s = students[id];
        return (s.name,s.birthdate,s.department,s._address,s.email,s.mobile_no,s.semester,s.CGPA,s.university);

    }
}
