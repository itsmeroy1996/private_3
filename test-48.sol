// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

import "./SafeMath.sol";
import "./IERC20.sol";
import "./Context.sol";
import "./ReentrancyGuard.sol";
import "./Ownable.sol";

contract WStock3 is ReentrancyGuard, Context, Ownable {

  function sell(bytes32 ticker, uint256 amount, uint256 total, uint256 timestamp, uint8 v, bytes32 r, bytes32 s) public nonReentrant {
    //address signer = ecrecover(hash, v, r, s);
    require(signer == authAddress, "Invalid signature");

  }

}
