# Big Billion Days (BBD) Regional Performance Review

## Environment & Tooling

- **SQL Compiler & Dialect**: SQLite online.
- **Spreadsheet Software**: Google Sheets.
- **Dashboard Platform**: Tableau Public (Specification documented in `docs/dashboard_spec.md`).
- **AI Verification Framework**: Human-in-the-Loop audit protocol documented in `docs/ai_log.md`.

## Executive Summary: Three Most Important Findings

Across Flipkart's Big Billion Days (BBD) September–November 2026 sale cycle, total completed revenue reached ₹3,46,200 across 63 completed orders (106 total units sold). First, the **North region** emerged as the clear market leader, generating ₹1,19,300 (34.5% of total revenue) driven heavily by Electronics, while the East region lagged in average basket size despite strong customer participation. Second, **category dynamics shifted dramatically over time**: Electronics demand peaked early in September (₹60,500) before contracting sharply by November (₹24,300), whereas Home goods experienced a powerful rebound in November (₹47,300), proving that promotional focus must dynamically shift across categories mid-campaign. Third, **operational fulfillment friction** (pending and disputed orders) trapped ₹1,43,300 in unrealized gross volume, indicating that regional marketing expansions must be preceded by dispute and inventory audits to protect campaign profitability.

## File Index & Mapping

| File Path | Description / Purpose | Project Part |
|---|---|---|
| `README.md` | Project overview, environment, summary, file index, and assumptions | Root / All Parts |
| `sql/00_schema_and_seed.sql` | Relational schema creation and seed data insertion script | Part A |
| `sql/q01.sql` to `sql/q13.sql` | Individual SQL query files answering core business reporting questions | Part A |
| `sql/d1_corrected.sql` | Corrected SQL query for AI verification Scenario D1 | Part D |
| `results/query_results.md` | Record of seed check row counts and Markdown output tables for q01–q13 | Part A |
| `data/orders_enriched.csv` | Exported raw order-level fact table from query q09 (90 rows) | Part A / Part B |
| `data/orders_clean.csv` | Cleaned and sorted completed order data exported from spreadsheet (63 rows) | Part B / Part C |
| `docs/spreadsheet_notes.md` | Spreadsheet formulas, aggregate results, pivot tables, reconciliation, and validation notes | Part B |
| `docs/dashboard_spec.md` | Tableau Public dashboard specification, field classifications, layouts, and narrative | Part C |
| `docs/ai_log.md` | AI-assistance audit log, prompt specs, defect tables, HITL protocol, and skeptical analysis | Part D |

## Assumptions Made

1. **Revenue Definition**: Strictly defined revenue as the sum of order amounts where `status = 'completed'`. Pending and disputed orders (including orders with missing amounts such as 1001, 1010, and 1064) were excluded from revenue aggregations to prevent unfulfilled commitments from inflating financial metrics.
2. **Text Normalization**: Customer names with irregular spacing and capitalization were standardized using nested `PROPER(TRIM(...))` functions in the spreadsheet layer to ensure clean, professional reporting in the dashboard.
3. **Lookup Fallback Behavior**: In the spreadsheet layer, XLOOKUP was configured with the fallback string `"UNKNOWN_ITEM"` for unmatched item keys, ensuring robust error handling if unmapped product master data is introduced in future campaign cycles.
4. **Performance Tier Thresholds**: Rep performance tiers in `q13` were evaluated against monthly targets (`Below Target` if < target, `On Target` if $\ge$ target and $< 1.1 \times$ target, and `Above Target` otherwise) directly using conditional expressions without storing intermediate flags in the base tables.
