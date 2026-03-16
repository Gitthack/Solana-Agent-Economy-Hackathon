# Tuning Long Report

Date: 2026-03-16
Context: long-run (72-hour equiv.) backtest of two candidate parameter sets for SOL/USDC market using depth-based slippage model and bitget-wallet-skill for security/price queries.

---

## Summary of Results

Source files:
- Raw kline: mm/data/sol_kline_raw.json
- Processed 1m kline: mm/data/sol_usdc_1m.json (1437 records)
- Long-run summary: mm/tuning_long_summary.json
- Per-scenario archives: mm/archive/long_runs/
  - aggressive_top1/ (nav.png + result.json)
  - conservative/ (nav.png + result.json)

Key outputs (72h-equivalent):

1) aggressive_top1
- params: spread=1.0% , base_size=1.0 SOL, max_inventory=10
- final_price: 93.1461 USDC
- final_inventory: -10.0 SOL
- cash: 966.36 USDC
- nav_final: 34.90 USDC
- trade_count: 258
- fees: 57.99 USDC

2) conservative
- params: spread=0.5% , base_size=0.5 SOL, max_inventory=5
- final_price: 93.1461 USDC
- final_inventory: -5.0 SOL
- cash: 440.66 USDC
- nav_final: -25.08 USDC
- trade_count: 26
- fees: 2.87 USDC

Interpretation:
- Under current simulated market dynamics and depth-slippage model, the aggressive parameterization produced a positive NAV for the 72-hour run while the conservative set produced negative NAV. The aggressive run traded more frequently and accumulated larger inventory exposure (hence higher fees and greater position risk).
- These are *simulation* results based on a simplified depth/slippage model and historical kline. They do not guarantee live performance.

---

## Risks & Caveats

1. Model simplifications:
   - Fill probability and slippage functions are approximations based on average volume; they do not represent full orderbook dynamics or adversarial liquidity events.
2. Inventory risk:
   - Aggressive config pushes inventory to the max_inventory cap (-10 SOL observed). Without automated hedging or rebalancing, exposure to sharp adverse moves is high.
3. Fees & MEV:
   - High-frequency trading increases fee drag; cross-route MEV or frontrunning risks not modeled.
4. Exchange/chain operational risk:
   - RPC outages, CEX API limits, and rate limiting can interrupt execution. Bitget skill calls intermittently returned structured responses — still need production monitoring and retries.
5. Compliance & market rules:
   - Automated market activity must respect exchange policies and local regulations.

Mitigations:
- Enforce stricter max_inventory (start low, e.g., 3 SOL) and adaptive base_size. Add auto-hedge or scheduled rebalancing.
- Use conservative spreads for live tests; use aggressive params only for discovery/backtest phases.
- Implement circuit-breakers (max hourly loss, consecutive losing trades threshold) and manual approval for scaling to live funds.

---

## Recommended Next Steps (short-term, prioritized)

Immediate (next 24 hours)
1. Choose primary parameter set to move toward staging:
   - Recommendation: start **conservative** but with tuned base_size (e.g., spread=0.5%, base=0.3, max_inv=3) for first live tests. Use the aggressive set only for exploration.
2. Implement hedging or auto-rebalance rule: when inventory exceeds threshold X, submit counter-orders or reduce new quotes.
3. Produce demonstrable artifacts for hackathon: repo with README, one-click run (devnet), 2–3 minute demo video, and X Article draft.

Mid-term (24–72 hours)
1. Run extended paper run (7 days equivalent) with selected params, collect metrics and screenshots.
2. Dockerize runner, add systemd unit and healthchecks, and prepare a simple dashboard snapshot.
3. Prepare submission package: GitHub repo, README, X Article, demo video, and instructions for reviewers.

Pre-live checklist (before any mainnet funds)
- Audit token contract (if operating on small/new tokens)
- Limit order sizes and NAV exposure
- Use dev/test keys for trials; only use mainnet keys after manual approval and multisig/hardware wallet policy

---

## Timeline Feasibility (Hackathon window)

Current date: 2026-03-16
Hackathon ends: 2026-03-27 (submission deadline as stated in event description)
Time remaining: ~11 days

Is the time sufficient?
- Yes — the window is tight but feasible if we prioritize the MVP essentials. Focus on: (1) reproducible demo (devnet/sim), (2) short demo video + README, (3) X Article with links and instructions. Do not spend time on full production hardening unless you plan post-hackathon continuation.

Minimum deliverables to submit successfully:
- Public GitHub repo with code and instructions (one branch / release)
- Demo video (2–3 minutes) showing: buy flow (simulated), trade run, results, and risk cut-off working
- X Article describing product, how to run, and a link to repo + demo
- (Optional but high ROI) live devnet demo URL or instructions for reviewer to run locally

Suggested schedule to hit deadline (11 days):
- Day 0–1: finalize strategy params, run 72h sim (done), pick conservative live params; create repo & README
- Day 2: Dockerize, create demo script, create sample outputs & screenshots
- Day 3: Record demo video; draft X Article
- Day 4: Polish README, finalize demo artifacts, create release tag
- Day 5–10: reserve for polishing, additional tests, and Bitget award-specific materials (paper trading results) and submission

---

## Action Items for Me (if you confirm)
- Implement hedging/rebalance rule and conservative params, run 7-day-equivalent paper run and produce final metrics & plots. (ETA: 24–48 hours)
- Dockerize and create manifest + one-click devnet run. (ETA: 12 hours)
- Draft X Article and demo script for your review. (ETA: 6–8 hours)

---

Files written by this report:
- mm/tuning_long_summary.json (raw long-run summary)
- mm/tuning_long_report.md (this file)


Prepared by: 发财 🤑
