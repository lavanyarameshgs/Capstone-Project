# 

# Part C — Dashboard Specification \& Business Narrative

## Data Source

Connected to `data/orders\\\\\\\_clean.csv` (63 rows, 13 columns).

|Column Name|Classification|Data Type|Role|
|-|-|-|-|
|`order\\\\\\\_id`|Dimension|Integer|Unique Order Identifier|
|`order\\\\\\\_month`|Dimension|String/Text|Monthly Cohort (`YYYY-MM`)|
|`clean\\\\\\\_first\\\\\\\_name`|Dimension|String|Customer First Name|
|`clean\\\\\\\_last\\\\\\\_name`|Dimension|String|Customer Last Name|
|`region`|Dimension|String|Sales Region|
|`rep\\\\\\\_name`|Dimension|String|Sales Representative Name|
|`item`|Dimension|String|Product Name|
|`category`|Dimension|String|Product Category|
|`unit\\\\\\\_price`|Measure|Integer|Item Unit Price (INR)|
|`quantity`|Measure|Integer|Units Purchased|
|`amount`|Measure|Integer|Order Amount (INR)|
|`revenue\\\\\\\_calc`|Measure|Integer|Calculated Revenue (`unit\\\\\\\_price \\\\\\\* quantity`)|
|`status`|Dimension|String|Order Status (`completed`)|

\---

## 

## KPI Cards

1. **Total Revenue Card**: `SUM(amount)` = **₹3,46,200**.

   * *Confirmation*: This value exactly matches Part A's `q05` `total\\\\\\\_revenue` of ₹3,46,200.
2. **Total Units Sold Card**: `SUM(quantity)` = **106 units**.

\---

## 

## Chart Sheets

### 

### 1\. Revenue by Region

* **Chart Type**: Horizontal Bar Chart.
* **Shelves**: Rows = `region`, Columns = `SUM(amount)`, Color = `region`.
* **Justification**: A horizontal bar chart facilitates immediate visual rank comparison across distinct geographical territories.
* **Data Table**:

|Region|Revenue (INR)|
|-|-|
|North|119300|
|South|82500|
|West|78000|
|East|66400|

### 

### 2\. Revenue by Category

* **Chart Type**: Vertical Bar Chart.
* **Shelves**: Columns = `category`, Rows = `SUM(amount)`, Color = `category`.
* **Justification**: Vertical bars clearly display discrete category totals and highlight product line dominance.
* **Data Table**:

|Category|Revenue (INR)|
|-|-|
|Electronics|143000|
|Home|116100|
|Apparel|87100|

### 

### 3\. Revenue Trend by Month and Category

* **Chart Type**: Multi-Line Chart.
* **Shelves**: Columns = `order\\\\\\\_month`, Rows = `SUM(amount)`, Color = `category`.
* **Justification**: Line charts effectively communicate temporal trends, trajectory changes, and seasonal category cross-overs.
* **Data Table**:

|Order Month|Apparel|Electronics|Home|Total|
|-|-|-|-|-|
|2026-09|22100|60500|46400|129000|
|2026-10|32100|58200|22400|112700|
|2026-11|32900|24300|47300|104500|

### 

### 4\. Region x Category Detail

* **Chart Type**: Text Table (Matrix).
* **Shelves**: Rows = `category`, Columns = `region`, Text = `SUM(amount)`.
* **Justification**: Provides granular numeric lookup for regional category managers inspecting exact cross-tabulated figures.
* **Data Table**:

|Category|East|North|South|West|Total|
|-|-|-|-|-|-|
|Apparel|10600|18000|21000|37500|87100|
|Electronics|18700|66800|31900|25600|143000|
|Home|37100|34500|29600|14900|116100|
|**Total**|**66400**|**119300**|**82500**|**78000**|**346200**|

\---

## 

## Dashboard Layout

* **Container Structure**: Top-level Vertical Container containing:

  1. Header Band (Title \& Metadata).
  2. Horizontal Container: Top KPI Cards (Total Revenue \& Total Units Sold).
  3. Filter Band: Global Category Filter dropdown (Applied to all worksheets using this data source).
  4. Middle Band: Line Chart (`Revenue Trend by Month and Category`).
  5. Lower Band (Horizontal Container): Side-by-side Bar Charts (`Revenue by Region` \& `Revenue by Category`).
  6. Bottom Band: Cross-tab Matrix (`Region x Category Detail`).
* **Interactive Action**: Clicking a bar in `Revenue by Region` (with **Use as Filter** enabled) passes a filter on `region` to the category bar chart, trend line chart, and detail matrix, instantly isolating that specific region's performance across all views.

\---

## 

## Insight and Recommendation Narrative

### Visualization Summary

The dashboard maps Flipkart's BBD sale across 4 regions, 3 product categories, and 3 sale months. It highlights high revenue concentration in North Electronics and Home products, alongside a overall decline in month-over-month BBD order volume from September to November.

### 

### Summary Analysis

1. **Regional Performance Hierarchy**: North generated **₹1,19,300** (34.5% of total BBD revenue), surpassing South (**₹82,500**), West (**₹78,000**), and East (**₹66,400**). North's dominance is driven primarily by Electronics (₹66,800).
2. **Category Trajectory Shifts**: Electronics collapsed from **₹60,500** in Sept to **₹24,300** in Nov (a 59.8% decline), whereas Home goods rebounded strongly from **₹22,400** in Oct to **₹47,300** in Nov.
3. **Apparel Stability**: West leads Apparel with **₹37,500** in revenue (43.1% of all Apparel sales). Apparel was the only category showing steady monthly growth across BBD: ₹22,100 (Sept) → ₹32,100 (Oct) → ₹32,900 (Nov).

### 

### Recommendations

1. **Re-allocate Marketing Capital to High-Tier Electronics in North \& South**:

   * *Action*: Direct 40% of Q4 performance marketing funds toward Smart Watch and Air Fryer bundles in North and South.
   * *Data Motivation*: Electronics in North (₹66,800) and South (₹31,900) comprise 69% of all BBD Electronics sales.
   * *Success Metric*: Growth in High-tier category sales volume and achievement of >1.1x monthly sales targets by sales reps Arjun Mehta and Kavya Nair.
2. **Expand Apparel Merchandising in East Region**:

   * *Action*: Introduce targeted multi-buys for Cotton Kurtas and Denim Jackets in East.
   * *Data Motivation*: East generated only **₹10,600** in Apparel revenue compared to West's **₹37,500**, despite East having strong overall customer participation.
   * *Success Metric*: Increase East regional Apparel revenue by at least 50% in the following campaign cycle.
3. **Operational Dispute \& Fulfillment Audit in North and East**:

   * *Action*: Audit order fulfillment pipelines for Air Fryer and Wireless Earbuds to eliminate disputed/pending orders.
   * *Data Motivation*: Disputed and pending orders trap ₹1,43,300 in unrealized gross volume across BBD (as seen in q06: ₹63,900 pending + ₹79,400 disputed).
   * *Success Metric*: Reduce order dispute rate below 3% of total orders placed.



\---

## Reconciliation Table

|Source / Visual|Value (INR)|Reconciled?|
|-|-|-|
|**KPI Card: Total Revenue**|346,200|Yes|
|**Sum of Revenue by Region Visual**|346,200|Yes|
|**Sum of Revenue by Category Visual**|346,200|Yes|
|**Part B Pivot Grand Total**|346,200|Yes|



