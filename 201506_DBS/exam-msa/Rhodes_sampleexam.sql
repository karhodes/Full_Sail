-- SAMPLE EXAM
-- Name:  Kelly Rhodes
-- Date:  June 23, 2015


-- *****************************************
--        PART II: Keys and Indexes
-- *****************************************

-- ************** QUESTION 1: **************
-- Some of the lookup tables use surrogate keys with typical "id" columns: "msa_jobs" and "msa_areas".  
-- Use ALTER TABLE statements to add primary keys to each of these tables and paste the SQL below.  
-- If you don't remember the ALTER TABLE syntax from your homework, look it up in the mySQL Help in Sequel Pro.



-- ************** QUESTION 2: **************
-- One of the lookup tables uses a simple, natural key: "msa_states".  
-- Use an ALTER TABLE statement to add a primary keys to this table.



-- ************** QUESTION 3: **************
-- The facts table, "msa_facts", uses a composite key.  
-- Refer to the entity diagram and use an ALTER TABLE statements to add a primary key to this table.


-- ************** QUESTION 4: **************
-- Refer to the entity diagram and use ALTER TABLE statements to add all of the required foreign key constraints.  
-- You should end up with 3 foreign keys.  
-- Remember to set all foreign keys to cascade.



-- ************** QUESTION 5: **************
-- You should also create a few unique indexes to make sure no data is duplicated.  
-- Write ALTER TABLE or CREATE UNIQUE INDEX statements to add a unique index to each Name column in the "msa_jobs" and "msa_areas" tables.

SQL:  (2 statements)



-- *****************************************
--        PART III: Normalization
-- *****************************************

-- Your goal for this section is to split the data from the "msa_raw" table into the supporting tables.
-- Keep an eye out for errors as you import -- the unique indexes and primary keys you created will prevent you from inserting duplicate records, 
-- so your SELECT queries will need to ensure that each record is unique.

-- ************** QUESTION 1: **************
-- Use an INSERT-SELECT statement to populate the "msa_states" table.  
-- Make sure you don't insert any NULL or blank records!
-- *** Count of records in "msa_states": [ 40-60 ]


-- ************** QUESTION 2: **************
-- Do the same for "msa_areas".  Be sure to include the State.
-- *** Count of records in "msa_areas": [ 300-500 ]


-- ************** QUESTION 3: **************
-- Do the same for "msa_jobs".  Be sure to include the Level.
-- *** Count of records in "msa_jobs": [ 800-850 ]


-- ************** QUESTION 4: **************
-- Do the same for "msa_facts".
-- *** Count of records in "msa_facts": [ 300000-310000 ]



-- Now that your tables are normalized, keyed, and indexed, you should no longer use the "msa_raw" table for any of your queries.  
-- To prevent you from forgetting, you may want to rename the table to "DONOTUSE".  
-- You will not get any points for queries that use this table.


-- *****************************************
--        PART IIV: Views
-- *****************************************

-- This data set includes records that are summaries of other records.  
-- For example, jobs ending in "-0000" summarize the other records that have the same prefix: 
-- "15-0000" summarizes all of the "15-****" records.  
-- The "00-0000" records summarize all of the other records for that year.
-- If you ran queries without taking these summary records into account, you might end up with bogus results.

-- 1. Create three views of your "msa_jobs" table named "msa_jobs_total", "msa_jobs_major", and "msa_jobs_detail".  
-- Each view should include only the ID and Name columns, and only the records with the appropriate Level.  
-- (The Detail level should include only jobs without a Level -- the detail records.)

-- *** Count of records in view "msa_jobs_total": [ 0-10 ]
-- *** Count of records in view "msa_jobs_major": [ 20-30 ]
-- *** Count of records in view "msa_jobs_detail": [ 750-800 ]


2. Using the "msa_jobs_detail" view as a base, inner join to the "msa_facts" table to make a new view named "msa_facts_detail" which contains only the Detail-level facts.  Fetch the unique columns from both tables (don't get two IDs).

*** Count of records in view "msa_facts_detail": [ 280000-290000 ]
SQL:


3. Build on your "msa_facts_detail" view to create a new view named "msa_facts_detail_area" view, which includes the Area Name and State.

*** Count of records in view "msa_facts_detail_area": [ 280000-290000 ]
SQL:



PART V: Aggregates,

Use your "msa_facts_detail_area" and aggregate functions to answer the following questions.  You will need to provide both the numeric answer and the SQL to find your answer.

1. How many employed people were included in the statistics for each year?

Year  Employed
====  =============
2008  [ 110M-120M ]
2009  [ 100M-110M ]

SQL:


2. Refactor your query to replace the number of employed with two new columns: the average Annual Mean salary (how much does the average American make per year?), and the total wages earned per year by all Americans (use the same Annual Mean, multiplied by the number of employed).  Divide the total wages by 1 trillion to get an easier number, and report the answer to 4 decimal places.

Year  AvgAnnual    TotalWages
====  ===========  =============
2008  [ 40K-50K ]  [ 4.7T-4.8T ]
2009  [ 40K-50K ]  [ 4.7T-4.8T ]

SQL:


3. Start a new query, still using your "msa_facts_detail_area" view.  This one will look for computer jobs (which have an ID that starts with '15') in Florida in 2009.  For each job, get the lowest, highest, and average annual mean salary.  Filter out any jobs that average less than $60K/year.  Order your results from highest to lowest average salary.

*** If the top result is rank 1, what's the rank 1 job? [ ... ]
*** What rank do Database Administrators get? [ 1-15 ]
*** What's the minimum annual salary for a DBA job? [ 50000-60000 ]

SQL:



PART VI: Subqueries

1. Your "msa_facts_detail" view uses inner joins.  Rewrite the query so that instead of joining to your "msa_jobs_detail" view, it joins your "msa_facts" table to an inline view subquery of your "msa_jobs" table that performs the same filtering.  It should return the same results as the detail view.

*** Count of records: [ 280000-290000 ]
SQL:


2. Refactor your last query to include a join to another subquery that returns only areas in Florida.

*** Count of records [ 16000-17000 ]
SQL:


3. You're going to refactor your Florida jobs query from above to use a scalar subquery.
  a. Start with your "msa_jobs" table and filter so that all of the job IDs start with '15'.
  b. Use a scalar subquery to find the average annual mean salary for each job -- this will involve joining your "msa_facts" table to your "msa_areas" table and filtering for Florida in 2009.
  c. Don't forget to join your scalar subquery back to your main table!
  d. Perform the same filtering to eliminate average salaries below $60K.
  e. Order by descending average salary.

*** Average annual salary for DBAs: [ 65000-70000 ]
SQL:





