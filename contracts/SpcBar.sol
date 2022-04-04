// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

// PscBar is the coolest bar in town. You come in with some Spc, and leave with more! The longer you stay, the more Spc you get.
//
// This contract handles swapping to and from xSpc, SpcSwap's staking token.
contract SpcBar is ERC20("SpcBar", "xSpc"){
    using SafeMath for uint256;
    IERC20 public Spc;

    // Define the Spc token contract
    constructor(IERC20 _Spc) public {
        Spc = _Spc;
    }

    // Enter the bar. Pay some Spcs. Earn some shares.
    // Locks Spc and mints xSpc
    function enter(uint256 _amount) public {
        // Gets the amount of Spc locked in the contract
        uint256 totalSpc = Spc.balanceOf(address(this));
        // Gets the amount of xSpc in existence
        uint256 totalShares = totalSupply();
        // If no xSpc exists, mint it 1:1 to the amount put in
        if (totalShares == 0 || totalSpc == 0) {
            _mint(msg.sender, _amount);
        } 
        // Calculate and mint the amount of xSpcthe Spc is worth. The ratio will change overtime, as xSpc is burned/minted and Spc deposited + gained from fees / withdrawn.
        else {
            uint256 what = _amount.mul(totalShares).div(totalSpc);
            _mint(msg.sender, what);
        }
        // Lock the Spc in the contract
        Spc.transferFrom(msg.sender, address(this), _amount);
    }

    // Leave the bar. Claim back your Spcs.
    // Unlocks the staked + gained Spc and burns xSpc
    function leave(uint256 _share) public {
        // Gets the amount of xSpc in existence
        uint256 totalShares = totalSupply();
        // Calculates the amount of Spc the xSpc is worth
        uint256 what = _share.mul(Spc.balanceOf(address(this))).div(totalShares);
        _burn(msg.sender, _share);
        Spc.transfer(msg.sender, what);
    }
}
