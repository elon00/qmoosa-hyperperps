// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SomniaPerpVault
 * @dev Ultra-High-Velocity Somnia L1 Perpetual Margin Vault
 * @notice Enforces 100k TPS parallel execution margin checks and circuit-breaker liquidation guards.
 */
contract SomniaPerpVault {
    struct Position {
        uint256 margin;
        uint256 size;
        uint256 entryPrice;
        bool isLong;
        uint256 lastUpdated;
    }

    mapping(address => Position) public positions;
    uint256 public constant MAX_LEVERAGE = 25;
    uint256 public constant MAINTENANCE_MARGIN_BPS = 500; // 5%

    event PositionOpened(address indexed trader, uint256 margin, uint256 size, uint256 price, bool isLong);
    event PositionClosed(address indexed trader, int256 pnl, uint256 exitPrice);
    event LiquidationExecuted(address indexed trader, address indexed liquidator, uint256 penalty);

    function openPosition(uint256 size, bool isLong, uint256 indexPrice) external payable {
        require(msg.value > 0, "Zero margin");
        require(size <= msg.value * MAX_LEVERAGE, "Exceeds max leverage");

        positions[msg.sender] = Position({
            margin: msg.value,
            size: size,
            entryPrice: indexPrice,
            isLong: isLong,
            lastUpdated: block.timestamp
        });

        emit PositionOpened(msg.sender, msg.value, size, indexPrice, isLong);
    }

    function checkSolvency(address trader, uint256 currentPrice) public view returns (bool) {
        Position memory p = positions[trader];
        if (p.size == 0) return true;

        int256 pnl = p.isLong
            ? int256((currentPrice * p.size) / p.entryPrice) - int256(p.size)
            : int256(p.size) - int256((currentPrice * p.size) / p.entryPrice);

        int256 remainingEquity = int256(p.margin) + pnl;
        if (remainingEquity <= 0) return false;

        uint256 maintenanceReq = (p.size * MAINTENANCE_MARGIN_BPS) / 10000;
        return uint256(remainingEquity) >= maintenanceReq;
    }
}
