// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;
import "../interfaces/IRewarder.sol";


contract RewarderBrokenMock is IRewarder {
    // Update the information of pendingtoken
    function onSpcReward (uint256, address, address, uint256, uint256) override external {
        revert();
    }
    // Take the pending token
    function pendingTokens(uint256 pid, address user, uint256 SpcAmount) override external view returns (IERC20[] memory rewardTokens, uint256[] memory rewardAmounts){
        revert();
    }
  
}
