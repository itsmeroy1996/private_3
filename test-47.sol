pragma solidity 0.8.4;
contract betminer {
    function checklasttwentyblock() view public returns(uint256, uint256) {
    
        if(uint256(blockhash(block.hash-1)) % 34344 == 1){
            uint256 crew = uint256(blockhash(block.hash-1)) % 34344;
            return (crew, block.hash-1);
        }

    }
        
}
