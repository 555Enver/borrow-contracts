// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.10;

import "../interfaces/ICoreBorrow.sol";
import "../interfaces/IFlashAngle.sol";

contract MockCoreBorrow is ICoreBorrow {
    mapping(address => bool) public flashLoaners;
    mapping(address => bool) public governors;
    mapping(address => bool) public guardians;

    function isFlashLoanerTreasury(address treasury) external view override returns (bool) {
        return flashLoaners[treasury];
    }

    function isGovernor(address admin) external view override returns (bool) {
        return governors[admin];
    }

    function isGovernorOrGuardian(address admin) external view override returns (bool) {
        return guardians[admin];
    }

    function toggleGovernor(address admin) external {
        governors[admin] = !governors[admin];
    }

    function toggleGuardian(address admin) external {
        guardians[admin] = !guardians[admin];
    }

    function toggleFlashLoaners(address admin) external {
        flashLoaners[admin] = !flashLoaners[admin];
    }

    function addStablecoinSupport(IFlashAngle flashAngle, address _treasury) external {
        flashAngle.addStablecoinSupport(_treasury);
    }

    function removeStablecoinSupport(IFlashAngle flashAngle, address _treasury) external {
        flashAngle.removeStablecoinSupport(_treasury);
    }

    function setCore(IFlashAngle flashAngle, address _core) external {
        flashAngle.setCore(_core);
    }
}
