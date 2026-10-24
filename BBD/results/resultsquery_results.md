# Query Results

## Seed check
- `reps`: 4 rows
- `products`: 9 rows
- `customers`: 24 rows
- `orders`: 90 rows

---

## q01
**Rows returned:** 19 (showing first 5 rows)

| order_id | customer_id | item | amount |
| :--- | :--- | :--- | :--- |
| 1001 | 10 | Bluetooth Speaker | NULL |
| 1002 | 16 | Smart Watch | 4500 |
| 1004 | 19 | Cotton Kurta | 2800 |
| 1010 | 19 | Wireless Earbuds | NULL |
| 1033 | 18 | Denim Jacket | 2500 |

---

## q02
**Rows returned:** 3

| order_id | customer_id | item | status |
| :--- | :--- | :--- | :--- |
| 1001 | 10 | Bluetooth Speaker | pending |
| 1010 | 19 | Wireless Earbuds | pending |
| 1064 | 20 | Bluetooth Speaker | pending |

---

## q03
**Rows returned:** 5

| order_id | customer_id | item | amount |
| :--- | :--- | :--- | :--- |
| 1061 | 16 | Air Fryer | 15600 |
| 1065 | 22 | Air Fryer | 15600 |
| 1069 | 15 | Air Fryer | 15600 |
| 1077 | 3 | Air Fryer | 15600 |
| 1006 | 5 | Smart Watch | 13500 |

---

## q04
**Rows returned:** 8

| customer_id | first_name | last_name | region | age |
| :--- | :--- | :--- | :--- | :--- |
| 24 | Reena | Kulkarni | West | 25 |
| 8 | Divya | Gupta | West | 26 |
| 17 | Farhan | Shah | North | 27 |
| 1 | aarav | Sharma | North | 28 |
| 16 | Nisha | Mishra | West | 36 |
| 5 |   Vikram | Singh  | North | 37 |
| 12 | Pooja | Menon | West | 39 |
| 21 | Manoj | Desai | North | 40 |

---

## q05
**Rows returned:** 1

| total_orders | total_revenue | avg_order_value | min_order_value | max_order_value |
| :--- | :--- | :--- | :--- | :--- |
| 63 | 346200 | 5495.24 | 1100 | 15600 |

---

## q06
**Rows returned:** 3

| status | number_of_orders | total_amount |
| :--- | :--- | :--- |
| completed | 63 | 346200 |
| pending | 19 | 60900 |
| disputed | 8 | 69200 |

---

## q07
**Rows returned:** 4

| item | number_of_orders | revenue |
| :--- | :--- | :--- |
| Air Fryer | 11 | 114400 |
| Smart Watch | 10 | 76500 |
| Wireless Earbuds | 13 | 64000 |
| Running Shoes | 8 | 39600 |

---

## q08
**Rows returned:** 4

| region | number_of_customers | average_age | min_age | max_age |
| :--- | :--- | :--- | :--- | :--- |
| East | 6 | 34.00 | 29 | 41 |
| North | 6 | 37.50 | 27 | 48 |
| South | 6 | 36.50 | 24 | 52 |
| West | 6 | 28.50 | 22 | 39 |

---

## q09
**Rows returned:** 90 (showing first 5 rows)

| order_id | order_month | first_name | last_name | region | rep_name | item | quantity | amount | status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1001 | 2026-09 | MEERA |   Patil | South | Kavya Nair | Bluetooth Speaker | 2 | NULL | pending |
| 1002 | 2026-09 | Nisha | Mishra | West | Neha Kulkarni | Smart Watch | 1 | 4500 | pending |
| 1003 | 2026-09 | Lakshmi | Kapoor | South | Kavya Nair | Air Fryer | 2 | 10400 | disputed |
| 1004 | 2026-09 | Gaurav | Yadav | East | Sanjay Roy | Cotton Kurta | 2 | 2800 | pending |
| 1005 | 2026-09 | Tanvi | Thakur | South | Kavya Nair | Table Lamp | 1 | 1100 | completed |

---

## q10
**Rows returned:** 4

| customer_id | first_name | last_name | region |
| :--- | :--- | :--- | :--- |
| 6 | Ananya | Reddy | South |
| 11 | Imran | Joshi | East |
| 17 | Farhan | Shah | North |
| 24 | Reena | Kulkarni | West |

---

## q11
**Rows returned:** 12

| region | order_month | number_of_orders | number_of_customers | total_revenue | average_revenue |
| :--- | :--- | :--- | :--- | :--- | :--- |
| East | 2026-09 | 2 | 2 | 6400 | 3200.00 |
| East | 2026-10 | 4 | 2 | 12200 | 3050.00 |
| East | 2026-11 | 6 | 4 | 37400 | 6233.33 |
| North | 2026-09 | 8 | 2 | 51500 | 6437.50 |
| North | 2026-10 | 6 | 4 | 39800 | 6633.33 |
| North | 2026-11 | 4 | 3 | 28000 | 7000.00 |
| South | 2026-09 | 6 | 3 | 20900 | 3483.33 |
| South | 2026-10 | 5 | 4 | 15100 | 3020.00 |
| South | 2026-11 | 7 | 4 | 46500 | 6642.86 |
| West | 2026-09 | 4 | 2 | 24700 | 6175.00 |
| West | 2026-10 | 5 | 3 | 24200 | 4840.00 |
| West | 2026-11 | 6 | 4 | 39500 | 6583.33 |

---

## q12
**Rows returned:** 9

| item | total_revenue | contribution_tier |
| :--- | :--- | :--- |
| Air Fryer | 114400 | High |
| Smart Watch | 76500 | High |
| Wireless Earbuds | 64000 | High |
| Running Shoes | 39600 | Medium |
| Denim Jacket | 22500 | Medium |
| Bluetooth Speaker | 14000 | Low |
| Cotton Kurta | 12600 | Low |
| Table Lamp | 11000 | Low |
| Bedsheet Set | 11600 | Low |

---

## q13
**Rows returned:** 12

| rep_name | order_month | monthly_target | revenue | performance_tier |
| :--- | :--- | :--- | :--- | :--- |
| Arjun Mehta | 2026-09 | 40000 | 51500 | Above Target |
| Arjun Mehta | 2026-10 | 40000 | 39800 | Below Target |
| Arjun Mehta | 2026-11 | 40000 | 28000 | Below Target |
| Kavya Nair | 2026-09 | 20000 | 20900 | On Target |
| Kavya Nair | 2026-10 | 20000 | 15100 | Below Target |
| Kavya Nair | 2026-11 | 20000 | 46500 | Above Target |
| Neha Kulkarni | 2026-09 | 20000 | 24700 | Above Target |
| Neha Kulkarni | 2026-10 | 20000 | 24200 | Above Target |
| Neha Kulkarni | 2026-11 | 20000 | 39500 | Above Target |
| Sanjay Roy | 2026-09 | 12000 | 6400 | Below Target |
| Sanjay Roy | 2026-10 | 12000 | 12200 | On Target |
| Sanjay Roy | 2026-11 | 12000 | 37400 | Above Target |