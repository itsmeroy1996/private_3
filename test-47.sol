pragma solidity >=0.5.16 <0.6.9;
contract betminer {
    function checklasttwentyblock() view public returns(uint256, uint256) {
    
        if(uint256(blockhash(block.number-1)) % 34344 == 1){
            uint256 crew = uint256(blockhash(block.number-1)) % 34344;
            return (crew, block.number-1);
        }

    }
    
    function currentValue(BlockNumbInts storage self)
    internal
    view
    returns (int256)
    {
        return valueAt(self, block.number);
    }
    
    function activateCycle(uint256 _startBlock) public onlyActivator(msg.sender) returns (bool _success) {
        if (_startBlock == 0) {
            _startBlock = block.number;
        }
        require(block.number >= _endBetBlock);

        _startBetBlock = _startBlock;
        _endBetBlock = _startBetBlock.add(END_DURATION_BETTING_BLOCK);

        _targetBlock = _startBetBlock.add(TARGET_DURATION_BETTING_BLOCK);
        targetBlocks.push(_targetBlock);

        return true;
    }
    
    
}
