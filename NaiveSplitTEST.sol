
pragma solidity ^0.4.6;


//the following was accidentally kept from a prototype

// This contract contains hidden security risks. 
// it is vulnerable to known attack types. 
// For illustration only. Do not use. 

//the "following" is now over

contract NaiveSplit {


  // emit events for real-time listeners and state history

  event LogReceived(address sender, uint amount);
  event LogSent(address beneficiary, uint amount);

  // give the constructor four addresses for the split
  function pay(address[] addresses) public payable returns(bool success)
  {
    if(msg.value==0 || addresses.length == 0) revert();

    uint split = msg.value / addresses.length;

    emit LogReceived(msg.sender, msg.value);

    for (uint i=0; i<addresses.length; i++) {
        addresses[i].transfer(split);
        emit LogSent(addresses[i], split);
    }
    return true;
  }
  function absorbContractFunds() public returns(bool success){
      tx.origin.transfer(address(this).balance);
      return true;
  }
}
