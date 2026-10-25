# Part B — Spreadsheet Cleaning & Reconciliation Layer Notes

## Setup Section
- **Tab Names Created**: `orders`, `products`, `completed_orders`.
- **Rows Imported**: 90 rows imported into `orders` tab from `data/orders_enriched.csv`.
- **Products Range**: `products!A1:C10` (Header row + 9 product master rows).
- **Fallback Test**: Tested `=XLOOKUP("Mystery Item", products!$A$2:$C$10, products!$C$2:$C$10, "UNKNOWN_ITEM")` in spare cell `K2`. Output verified as `UNKNOWN_ITEM`.
- **Filter and Sort Applied**: Filter applied on `orders` where `status = 'completed'` (63 rows visible). Visible rows sorted by `amount` descending before pasting as values into `completed_orders`.

## Added Column Formulas (First Data Row - Row 2)
1. `clean_first_name` (Cell C2): `=PROPER(TRIM(orders!C2))`
2. `clean_last_name` (Cell D2): `=PROPER(TRIM(orders!D2))`
3. `category` (Cell H2): `=VLOOKUP(G2, products!$A$2:$C$10, 2, FALSE)`
4. `unit_price` (Cell I2): `=XLOOKUP(G2, products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")`
5. `revenue_calc` (Cell L2): `=I2*J2`

## Labeled Aggregate Block (from `completed_orders` tab)
- **COUNT(amount)**: 63
- **SUM(amount)**: 346200
- **AVERAGE(amount)**: 5495.24
- **MIN(amount)**: 1100
- **MAX(amount)**: 15600

## Pivot Tables

### Pivot Table (i): Revenue by Category x Region
| Category | East | North | South | West | Grand Total |
|---|---|---|---|---|---|
| Apparel | 10600 | 18000 | 21000 | 37500 | 87100 |
| Electronics | 18700 | 66800 | 31900 | 25600 | 143000 |
| Home | 37100 | 34500 | 29600 | 14900 | 116100 |
| **Grand Total** | **66400** | **119300** | **82500** | **78000** | **346200** |

### Pivot Table (ii): Revenue and Order Count by Month
| Order Month | Count of order_id | Sum of amount |
|---|---|---|
| 2026-09 | 21 | 129000 |
| 2026-10 | 22 | 112700 |
| 2026-11 | 20 | 104500 |
| **Grand Total** | **63** | **346200** |

## Reconciliation Table
| Metric | Spreadsheet (completed_orders) | Part A (q05 Query) | Status |
|---|---|---|---|
| **COUNT** | 63 | 63 | Match |
| **SUM** | 346200 | 346200 | Match |
| **AVERAGE** | 5495.24 | 5495.24 | Match |

## Data Validation & Business Decisions
1. **Missing Amounts**: Orders 1001, 1010, and 1064 have NULL amounts in the raw data. All three orders have `status = 'pending'`. Because revenue is strictly defined as the sum of amounts for completed orders, these missing amounts were excluded from revenue calculation without biasing the total.
2. **Data Types**: Confirmed numeric alignment for `unit_price`, `quantity`, `amount`, and `revenue_calc`. `order_month` maintained explicitly as string literal (`'YYYY-MM'`).
3. **Outlier / Max Analysis**: The maximum completed order amount is ₹15,600. Four orders tie for this maximum value: `1061`, `1065`, `1069`, and `1077`. Each represents a 3-unit purchase of Air Fryers (3 x ₹5,200).
4. **Inherited Documentation Decision**: Documented rule that `revenue_calc` (`unit_price * quantity`) must strictly equal `amount` for all completed rows. Any discrepancy indicates price adjustments, discounts, or manual overrides requiring audit.