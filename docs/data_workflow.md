# Workflow for Intermountain analysis:
- Write SQL that creates the analysis dataset and load to a final table in sandbox in interactive IDE (SQL Developer best at the moment), also spools to .csv
    - Possible to do this within the SQL script and cache?
- Munge file in R or Python
- Write processed dataset to .csv or .Rdata? (What preserves labels?)
- Write out each analysis into a separate notebook