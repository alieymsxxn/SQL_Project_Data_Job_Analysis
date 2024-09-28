/*
Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to
find the skill IDs with the highest counts in the skills_job_dim table and then join this result
with the skills_dim table to get the skill names.

WITH top_5_skills AS (
	SELECT 
		skill_id, 
		COUNT(job_id) jobs
	FROM skills_job_dim 
	GROUP BY skill_id 
	ORDER BY jobs DESC 
	LIMIT 5
)
SELECT sd.skills skill_name,
		t5s.skill_id,
		t5s.jobs
FROM skills_dim sd
INNER JOIN top_5_skills t5s ON sd.skill_id = t5s.skill_id;
*/


/*
Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying
the number of job postings they have. Use a subquery to calculate the total job postings per
company. A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the
number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on
size.

SELECT
	cd.company_id,
	cd.name,
	jpf2.jobs,
	CASE
		WHEN jpf2.jobs < 10 THEN 'SMALL'
		WHEN jpf2.jobs <= 50 THEN 'MEDIUM'
		WHEN jpf2.jobs > 50 THEN 'LARGE'
		ELSE 'UNKNOWN'
	END company_size
FROM company_dim cd
INNER JOIN
	(SELECT
		company_id,
		COUNT(*) jobs
	FROM job_postings_fact
	GROUP BY company_id) 
	jpf2 ON cd.company_id = jpf2.company_id;
*/

/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, name, and count of postings requiring the skill

WITH top_5_skills AS (
	SELECT 
		sjd.skill_id,
		COUNT(jpf.job_id) jobs
	FROM skills_job_dim sjd
	INNER JOIN job_postings_fact jpf ON sjd.job_id = jpf.job_id
	WHERE jpf.job_work_from_home = true
	GROUP BY sjd.skill_id
	ORDER BY jobs DESC
	LIMIT 5)


SELECT
	t5s.skill_id,
	sd.skills,
	t5s.jobs
FROM skills_dim sd
INNER JOIN top_5_skills t5s ON t5s.skill_id = sd.skill_id;
*/





