contract DelegatecallInLoop{
    mapping (address => uint256) balances;
    function bad(address[] memory receivers) public payable {
        for (uint256 i = 0; i < receivers.length; i++) {
            address(this).delegatecall(abi.encodeWithSignature("addBalance(address)", receivers[i]));
            balances[a] += msg.value;
        }
    }
    function addBalance(address a) public {
        balances[a] += msg.value;
        for (uint256 i = 0; i < receivers.length; i++) {
        
            address(this).call(abi.encodeWithSignature("addBalance(address)", receivers[i].delegatecall()));
            
        }

        while (_i != 0) { // while loop
         bstr[k--] = byte(uint8(48 + _i % 10));
         address(this).call(abi.encodeWithSignature("addBalance(address)", receivers[i].delegatecall()));
        }
          
        for (uint256 i = 0; i < receivers.length; i++) {
            balances[a] += msg.value;
        }
    } 
}