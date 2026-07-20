# Water Access & Sanitation in Africa — SQL Analysis

A SQL analysis of water access, sanitation infrastructure, and community health
indicators across African communities. Completed as a relational-database project
during the Axia Africa Data Analyst training program.

> **Note on the data:** the dataset is a structured training dataset (2,000 records,
> 10 countries). It was used to practice and demonstrate SQL analysis techniques;
> the figures below describe this dataset and are not intended as real-world findings
> on water access in Africa.

## Dataset

`Water_Supply_Sanitation_Africa.csv` — 2,000 communities across 10 countries and 10 regions, with 15 fields:

- **Location:** Region, Country, Community Name, Population
- **Water supply:** Water Source Type, Water Availability (litres per capita per day), Number of Functional / Non-Functional Water Points
- **Sanitation:** Sanitation Facility Type, Annual Maintenance Cost (USD)
- **Support & outcomes:** Government Support, NGO Support, Average Distance to Water Source (km), Waterborne Diseases Incidence Rate (%), Community Satisfaction Rate (%)

## Objective

Query the dataset to surface patterns in water availability, infrastructure
functionality, sanitation cost, and community health — and to practice the full
range of SQL techniques covered in training.

## Techniques used

- Aggregation and grouping (`AVG`, `SUM`, `GROUP BY`)
- Filtering with single and multiple conditions (`WHERE`, `AND`)
- Sorting and top-N retrieval (`ORDER BY`, `LIMIT`)
- De-duplication (`DISTINCT`)
- Rounding and aliasing for readable output (`ROUND`, `AS`)
- Window functions and subqueries (`RANK() OVER (PARTITION BY ...)`) to rank
  communities within each country

## Questions answered

**Assigned analysis:**
1. Average water availability (litres per capita per day) per country
2. Communities with at least one non-functional water point
3. Top five communities by annual sanitation maintenance cost
4. Total functional and non-functional water points
5. Communities with waterborne-disease incidence above 20%
6. Average distance to water source per region
7. Communities receiving both government and NGO support
8. Highest-population community per country (via window function)

**Self-defined extensions:**
- Average maintenance cost by sanitation facility type
- Whether communities receiving both government and NGO support show lower
  waterborne-disease incidence

## Selected results (this dataset)

- **1,816 of 2,000 communities (91%)** have at least one non-functional water point
- **16.1%** of all water points are non-functional (9,874 of 61,457)
- **665 communities** report waterborne-disease incidence above 20%
- Communities with **both** government and NGO support averaged a **14.7%**
  disease rate, versus **15.0%** for others — little difference across support
  levels, suggesting intervention presence alone does not track with lower
  disease incidence in this data

## Files

- `water access and saniation in Africa.sql` — all queries
- `Water_Supply_Sanitation_Africa.csv` — dataset

## Tools

MySQL
