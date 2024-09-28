/*
Query: What are the most in-demand skills for data analysts?
*/

SELECT
	sd.skills,
	COUNT(jpwc.id) jobs
FROM (
	SELECT 
		jpf.job_id id,
		jpf.job_title_short title,
		jpf.salary_year_avg avg_salary
	FROM job_postings_fact jpf
	WHERE job_title_short = 'Data Analyst'
	) jpwc
INNER JOIN skills_job_dim sjd ON jpwc.id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
GROUP BY sd.skills
ORDER BY jobs DESC
LIMIT 5;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "jobs": 92628
  },
  {
    "skills": "excel",
    "jobs": 67031
  },
  {
    "skills": "python",
    "jobs": 57326
  },
  {
    "skills": "tableau",
    "jobs": 46554
  },
  {
    "skills": "power bi",
    "jobs": 39468
  }
]
*/