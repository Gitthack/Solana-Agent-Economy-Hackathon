# Solana Agent Economy Hackathon — Agent Market Maker

Quick structure:
- docs/ : whitepaper, tuning report, X article, trade logs
- demo/ : demo video + demo package
- mm/ : backtesting and runner scripts
- Dockerfile + docker-compose.yml : demo runtime

---

ONE-CLICK REPRODUCTION GUIDE (for reviewers)

1) Clone the repository
   git clone https://github.com/Gitthack/Solana-Agent-Economy-Hackathon.git
   cd Solana-Agent-Economy-Hackathon

2) Option A — Docker (recommended)
   - Build and run:
     docker compose up --build
   - Inside the running container (or on host), run demo:
     bash mm/scripts/run_demo.sh
   - This will produce demo images and a demo video in the demo/ directory.

3) Option B — Local (no Docker)
   - Ensure Python 3.12 and required libs are available (see docs for venv setup).
   - Run demo script directly:
     bash mm/scripts/run_demo.sh

4) Artifacts for review
   - Demo video: demo/demo_video.mp4
   - Tuning & backtest report: docs/tuning_long_report.md
   - Trade logs (CSV): docs/trade_logs_passive.csv
   - Whitepaper: docs/whitepaper.md

5) Security & Notes
   - This demo uses historical data / simulation. It does NOT execute any mainnet trades.
   - Do NOT run with real mainnet keys unless you understand the risks and use multisig/hardware wallets.

6) Contact
   - Team: 大王 (Kuan Kings) / 发财 🤑

