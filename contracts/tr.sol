pragma solidity ^0.8.4;

contract MintandSend { //main idea is to mint a self-digital coin and use it to give loan
    address minter;
    mapping (address => uint) public balances;

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
        balances[msg.sender] = minter.balance;

    }

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    // function mint(address receiver, uint amount)  {
    //     balances[receiver] = receiver.balance;    
    //     require(msg.sender == minter);
    //     balances[msg.sender] -= amount ;
    //     balances[receiver] += amount;    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,1000000000000000000000
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4