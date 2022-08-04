pragma solidity 0.4.26;

contract Bug {

    struct innerStruct {
        uint x;
    }

    struct outerStruct {
        innerStruct inner;
    }

    mapping(uint => outerStruct) public testMapping;
    mapping(uint => uint) public testMapping2;
    mapping(uint => address) public testMapping3;

    constructor() public {
        testMapping[0].inner.x = 42;
    }
}

contract Test{

    struct innerStruct {
        uint x;
    }
    
    mapping(uint => innerStruct) public testMapping;

}
