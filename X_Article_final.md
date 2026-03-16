Solana Agent Economy Hackathon — Agent Market Maker (Demo)

Team: 大王 / 发财 🤑

Summary

We built a small agent-powered passive market-making skill for SOL/USDC that demonstrates:
- Safe quote+security checks via Bitget Wallet Skill
- Passive quoting strategy (configurable spread & size)
- On-demand paper trading and replayable demo

What to run (one‑click)

1. Clone repo
2. docker compose up --build
3. In container: bash mm/scripts/run_demo.sh

Highlights

- Demo video (2m): link in release
- Tuning report: tuning_long_report.md

Why this matters

Agent-to-Agent marketplaces need reliable financial primitives (market making, liquidity provision). Our demo shows a minimal, auditable, and reproducible pipeline that can be extended to on-chain settlement and pay-per-use skills.

