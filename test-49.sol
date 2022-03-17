// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

import "./SafeMath.sol";
import "./IERC20.sol";
import "./Context.sol";
import "./ReentrancyGuard.sol";
import "./Ownable.sol";

contract WStock3 is ReentrancyGuard, Context, Ownable {

  function buy(bytes32 ticker, uint256 amount, uint256 timestamp, uint8 v, bytes32 r, bytes32 s) public payable nonReentrant { // replaced total with msg.value
    require(amount > 0, "Must buy an amount of tokens");
    require(msg.value > 0, "total must be greater than zero");
    bytes32 hash = keccak256(abi.encode(_msgSender(), ticker, amount, msg.value, timestamp));
    address signer = ecrecover(hash, v, r, s);
    require(signer == authAddress, "Invalid signature");
    require(timestamp.add(acceptableTolerance) > block.timestamp, "Expired Order");
    require(address(stocks[ticker]) != address(0), "unsupported asset");
    uint256 fee = msg.value.mul(feeRate);
    require(fee <= GAS_TOKEN.balanceOf(_msgSender()), 'insufficient gas token balance');

    totalTrades++;
    emit Trade(totalTrades, _msgSender(), ticker, true, amount, msg.value, fee);
    stocks[ticker].mint(_msgSender(), amount);
    GAS_TOKEN.transferFrom(_msgSender(), holdingAddress, fee);
    if (address(this).balance >= reserve) {
      _safeTransfer(holdingAddress, msg.value);
    }
    else {
      emit Reload(reserve.sub(address(this).balance), block.timestamp);
    }
  }

}
