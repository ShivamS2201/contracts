pragma solidity ^0.6.0;

contract sendMoney{
    address payable public owner;
    uint256 public amt;


    constructor() public {
        owner = msg.sender;
        amt = owner.balance;
    }
    function sendM(uint val) public payable{
        require(val< amt,"No Credit Only Debit");
        owner.transfer(val);
        amt = amt - val;
    }
    function getBalance(
    ) public view returns(uint256){
        return owner.balance;
    }

}
//  0x0498B7c793D7432Cd9dB27fb02fc9cfdBAfA1Fd3 refers to the script