// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Pract1Sol
{
    struct Human {
        address userAddress;
       uint256 balance;
    }

    event Paid(address _from, uint _amount);

    mapping (address => uint256) user_money;

    function send_to_person(uint _amount) public payable {
        require(user_money[msg.sender] >= _amount, "Amount are greater then your balance!");
        require(_amount > 0, "You can send amout then greater 0!");
        payable(msg.sender).transfer(_amount);
        user_money[msg.sender] = user_money[msg.sender] - _amount;
    }

    function send_to_contract() public payable {
        require(msg.value > 0, "You can send amout then greater 0!");
        emit Paid(msg.sender, msg.value);
        user_money[msg.sender] = (user_money[msg.sender] + msg.value);
    }

    function getBalance() public view returns(uint){
        return user_money[msg.sender] / 10**18;
    }

}