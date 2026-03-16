# Agent Market Maker — Whitepaper (Short)

Authors: 大王 / 发财 🤑
Date: 2026-03-16

## Abstract
This short whitepaper describes Agent Market Maker, a demonstration agent that performs passive market making for SOL/USDC. It integrates Bitget Wallet Skill for security checks and routing quotes, and provides reproducible demo artifacts (video, Dockerized demo, and backtesting results).

## Architecture
- Frontend/CLI: Demo scripts and README for one-click runs.
- Agent Runner: Playwright/Open Browser optional layer for web interactions; current demo uses Python-based runner.
- Market Data: On-chain or exchange kline ingestion (we used Bitget market kline for historical sims).
- Risk & Security: Bitget Wallet Skill used for token security checks before trading; all fund-moving operations require signing.
- Settlement & Payments: Payment or x402 integration left extensible.

## Strategy
- Passive market making: place bids and asks around midprice with configurable spread and order size.
- Conservative default parameters for demo: spread=1.0%, base_size=0.1 SOL, max_inventory=3 SOL.
- Hedging: simple threshold-based hedge to reduce inventory exposure when inventory > 80% of max_inventory.

## Backtesting & Results
We performed parameter grid search and 7-day equivalent runs. Key artifacts stored in the repository include:
- tuning_long_report.md
- backtest archives in mm/archive/

## Risks and Mitigations
- High-frequency operations may be loss-making after fees; the demo uses passive config to minimize fee drag.
- No real funds used in demo; real deployment must use multisig/hardware keys and manual approval.

## How to reproduce
1. Clone repo
2. docker compose up --build
3. bash mm/scripts/run_demo.sh (inside container or locally)

## Files included in submission
- demo video (2min)
- tuning report & whitepaper
- docker image tar (optional)
- trade logs CSV

