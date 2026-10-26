# QMOOSA HyperPerps ($QPERP)
[![CI/CD Pipeline](https://github.com/elon00/qmoosa-hyperperps/actions/workflows/ci-cd-pipeline.yml/badge.svg)](https://github.com/elon00/qmoosa-hyperperps/actions/workflows/ci-cd-pipeline.yml)
[![Reality Check](https://img.shields.io/badge/Reality%20Check-100%2F100%20GENUINE%20GREEN-emerald.svg)](tests/reality_check_harness.py)
[![Hackathon](https://img.shields.io/badge/Hackathon-Somnia%20Network:%20dreamDEX%20Perps%20Builder%20Bounty-blue.svg)]()
[![PQC Standard](https://img.shields.io/badge/NIST-FIPS%20203%2F204-purple.svg)]()

> **Risk-controlled algorithmic perpetuals trading, real dreamDEX testnet SDK integration, trading telemetry and automated liquidation cascade protection.**

---

## 🏆 Hackathon Profile
- **Target Event:** Somnia Network: dreamDEX Perps Builder Bounty
- **Track:** Trading Bots, AI Agents & Perp DEX Developer Tools
- **Deadline:** November 1-2, 2026
- **Prize Pool:** $3,000
- **Blockchain:** Somnia Network L1 (Tokyo Testnet)

---

## 🚀 Key Features
- **64-bit Conway State Engine:** Deterministic cellular automaton state machine running 10,000 cycles in zero-dependency Rust.
- **Native Smart Contract:** `SomniaPerpVault.sol` optimized for Somnia Network L1 (Tokyo Testnet).
- **Agentic Service & x402 Gateway:** Autonomous Python payment client in `src/dreamdex_bot.py`.
- **Interactive QUX Launchpad:** Full-stack responsive HTML5 dashboard with Conway visualizer and Web4 QR generation in `index.html`.
- **Model Context Protocol (MCP):** 2 native tools exposed via `mcp.json`.

---

## 🧪 Testing & Verification
```bash
# Run 5-Gate Reality Check Test Harness
python tests/reality_check_harness.py

# Run Full Unit & Integrity Test Suite
python -m unittest tests/test_suite.py
```
