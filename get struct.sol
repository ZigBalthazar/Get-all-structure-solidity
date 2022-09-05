// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
contract SavingsAccount {
  struct Member{
    uint id;
    string name;
    uint balance;
  }
  mapping (uint => Member) public members;
  event savingsEvent(uint indexed _memberId);
  uint public memberCount;
  constructor() {
    memberCount = 0;
    addMember("Ali",9000);
    addMember("Hassan",6000);
  }
  function addMember(string memory _name, uint _balance) public {
    members[memberCount] = Member(memberCount,_name,_balance);
    memberCount++;
  }
function get(uint _memberId) public view returns(Member memory) {
    return members[_memberId];
  }

  function getMember() public view returns (uint[] memory, string[] memory,uint[]memory){
      uint[]    memory id = new uint[](memberCount);
      string[]  memory name = new string[](memberCount);
      uint[]    memory balance = new uint[](memberCount);
      for (uint i = 0; i < memberCount; i++) {
          Member storage member = members[i];
          id[i] = member.id;
          name[i] = member.name;
          balance[i] = member.balance;
      }
      return (id, name,balance);
  }
}