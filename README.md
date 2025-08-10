# Shivaharisha-ElevateLabs-Task4
README – Olist SQLite Analysis

Files:
- olist.sqlite → The database containing Olist e-commerce data.
- olist_analysis.sql → SQL script containing analysis queries.

Step Overview:
| Step | Purpose | Output Type |
|------|---------|-------------|
| 1 | Preview first 10 orders | Table |
| 2 | Show only delivered orders | Table |
| 3 | Show most recent delivered orders | Table |
| 4 | Count orders per customer | Table |
| 5 | Join orders with items | Table |
| 6 | Show items with price above average | Table |
| 7 | Display minimum, maximum, and average price of products | Table |
| 8 | Show top cities by number of orders | Table |
| 9 | Create `top_categories` view and preview it | Table |
| 10 | Create index on `order_items(order_id)` | Success message |

Notes:
- Step 9 creates a view for later use.
- Step 10 creates an index for performance optimization and does not return rows.
