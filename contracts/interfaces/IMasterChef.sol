// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;
import "@boringcrypto/boring-solidity/contracts/libraries/BoringERC20.sol";

interface IMasterChef {
    using BoringERC20 for IERC20;
    //Seting the infomation of User information
    struct UserInfo {
        uint256 amount;     // How many LP tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
    }
    //Setting the information of PoolInfo
    struct PoolInfo {
        IERC20 lpToken;           // Address of LP token contract.
        uint256 allocPoint;       // How many allocation points assigned to this pool. Spc to distribute per block.
        uint256 lastRewardBlock;  // Last block number that Spc distribution occurs.
        uint256 accSpcPerShare; // Accumulated Spc per share, times 1e12. See below.
    }
    // Get information of pool information
    function poolInfo(uint256 pid) external view returns (IMasterChef.PoolInfo memory);
    // Get total point alloction 
    function totalAllocPoint() external view returns (uint256);
    // Deposit for liquidity provider
    function deposit(uint256 _pid, uint256 _amount) external;
}
