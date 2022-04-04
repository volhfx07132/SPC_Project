// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;
import "@boringcrypto/boring-solidity/contracts/libraries/BoringERC20.sol";
interface IRewarder {
    // Using BoringERC20 for IERC20
    using BoringERC20 for IERC20;
    // Send profit(token Spc) for user staking
    function onSpcReward(uint256 pid, address user, address recipient, uint256 SpcAmount, uint256 newLpAmount) external;
    // Pending send token Spc for user staking
    function pendingTokens(uint256 pid, address user, uint256 SpcAmount) external view returns (IERC20[] memory, uint256[] memory);
}
