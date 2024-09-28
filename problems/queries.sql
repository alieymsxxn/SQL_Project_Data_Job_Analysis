/*
Date Functions - Probelm 1
Write a query to find the average salary both yearly ( salary_year_avg )and hourly
(salary_hour_avg) for job postings that were posted after June 1, 2023. Group the results by
job schedule type.

SELECT
	COALESCE(job_schedule_type, 'Remote'),
	AVG(COALESCE(salary_year_avg, 0)) yearly_avg, 
	AVG(COALESCE(salary_hour_avg, 0)) hourly_avg
FROM job_postings_fact
WHERE job_posted_date::DATE = '2023-07-01'
GROUP BY COALESCE(job_schedule_type, 'Remote');
*/

/* 
Date Functions - Probelm 2
Write a query to count the number of job postings for each month in 2023, adjusting the
job_posted_date to be in 'America/New_York' time zone before extracting (hint) the month.
Assume the job_posted_date is stored in UTC. Group by and order by the month.

SELECT
	COUNT(*) num_of_jobs,
	EXTRACT(MONTH FROM job_posted_date::DATE AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') month_of_job_post
FROM
	job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC') = 2023
GROUP BY
	EXTRACT(MONTH FROM job_posted_date::DATE AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')
ORDER BY
	month_of_job_post
*/

/*
Date Functions - Problem 3
Write a query to find companies (include company name) that have posted jobs offering health
insurance, where these postings were made in the second quarter of 2023. Use date extraction
to filter by quarter.
SELECT
	cd.name company_name
FROM
	job_postings_fact jpf
INNER JOIN company_dim cd ON jpf.company_id = cd.company_id
WHERE
	jpf.job_health_insurance = true
	AND EXTRACT(YEAR FROM jpf.job_posted_date) = 2023
	AND EXTRACT(QUARTER FROM jpf.job_posted_date) = 2
GROUP BY
	cd.name;
*/

/*
Practice Problem 6
Create three tables:
• Jan 2023 jobs
• Feb 2023 jobs
• Mar 2023 jobs
Foreshadowing: This will be used in another practice problem below.
Hints:
• Use CREATE TABLE table_name AS syntax to create your table
• Look at a way to filter out only specific months ( EXTRACT )

WHERE EXTRACT(YEAR FROM job_posted_date) = 2023
	AND EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE feb_2023_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2023
	AND EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_2023_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2023
	AND EXTRACT(MONTH FROM job_posted_date) = 3;
*/


/*
CASE
Practice Problem 1
I want to categorize the salaries from each job posting. To see if it fits in my desired salary range.
• Put salary into different buckets
• Define what's a high, standard, or low salary with our own conditions
• Why? It is easy to determine which job postings are worth looking at based on salary.
Bucketing is a common practice in data analysis when viewing categories.
• I only want to look at data analyst roles
• Order from highest to lowest

SELECT
	salary_year_avg,
	CASE
		WHEN salary_year_avg < 60000 THEN 'LOW'
		WHEN salary_year_avg >= 60000 AND salary_year_avg <= 200000 THEN 'STANDARD'
		WHEN salary_year_avg > 200000 THEN 'HIGH'
		ELSE 'UNKNOWN'
	END salary_bucket
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;

Rough WOrk:
SELECT
	MIN(salary_year_avg) min_salary,
	MAX(salary_year_avg) max_salary,
	AVG(salary_year_avg) avg_salary,
	CASE
		WHEN salary_year_avg < 60000 THEN 'LOW'
		WHEN salary_year_avg >= 60000 AND salary_year_avg <= 200000 THEN 'STANDARD'
		WHEN salary_year_avg > 200000 THEN 'HIGH'
		ELSE 'UNKNOWN'
	END salary_bucket
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
	CASE
		WHEN salary_year_avg < 60000 THEN 'LOW'
		WHEN salary_year_avg >= 60000 AND salary_year_avg <= 200000 THEN 'STANDARD'
		WHEN salary_year_avg > 200000 THEN 'HIGH'
		ELSE 'UNKNOWN'
	END
HAVING
	CASE
		WHEN MIN(salary_year_avg) < 30000 THEN
			CASE
				WHEN salary_year_avg < 60000 THEN 'LOW'
				WHEN salary_year_avg >= 60000 AND salary_year_avg <= 200000 THEN 'STANDARD'
				WHEN salary_year_avg > 200000 THEN 'HIGH'
				ELSE 'UNKNOWN'
			END = 'LOW'
		ELSE true
	END
ORDER BY min_salary DESC;
*/