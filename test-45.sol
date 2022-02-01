pragma solidity 0.8.4;
contract SimpleStorage {
  using SafeMath for uint256;

   //uint storedData;
   function set(uint x) public {
      storedData = x;
   }
   function get() public view returns (uint) {
      return storedData;
   }

}
