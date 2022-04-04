// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

interface IMiniChefV2 {
    // @Setting the information of entity UserInfo
    struct UserInfo {
        uint256 amount;
        uint256 rewardDebt;
    }
    // @Setting the information of entity PoolInfo
    struct PoolInfo {
        uint128 accSpcPerShare;
        uint64 lastRewardTime;
        uint64 allocPoint;
    }
    // @Get length of poolInfo
    function poolLength() external view returns (uint256);
    // @Update token1 and token2
    function updatePool(uint256 pid) external returns (IMiniChefV2.PoolInfo memory);
    // @Get the information of UserInfo
    function userInfo(uint256 _pid, address _user) external view returns (uint256, uint256);
    // @Deposit o=toekn to liquidity provided
    function deposit(uint256 pid, uint256 amount, address to) external;
    // @Liquidity provided withdraw token in LP
    function withdraw(uint256 pid, uint256 amount, address to) external;
    // @Get profit when staking
    function harvest(uint256 pid, address to) external;
    // @User withdraw profix and token Staking
    function withdrawAndHarvest(uint256 pid, uint256 amount, address to) external;
    // @Usert withdraw token toking and cancel with draw token Spc(profix)
    function emergencyWithdraw(uint256 pid, address to) external;
}