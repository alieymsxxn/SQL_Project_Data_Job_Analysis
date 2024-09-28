/*
Query: What are the top skills based on salary?
*/

SELECT
	sd.skills skill,
	ROUND(AVG(jpf.salary_year_avg), 2) avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
	jpf.job_title_short = 'Data Analyst'
    AND jpf.salary_year_avg IS NOT NULL
    AND jpf.job_work_from_home = True 
GROUP BY sd.skills
ORDER BY AVG(jpf.salary_year_avg) DESC
LIMIT 10;


/*
Here's a breakdown of the results for top paying skills for Data Analysts:
- High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.
[
  {
    "skill": "pyspark",
    "avg_salary": 208172.25
  },
  {
    "skill": "bitbucket",
    "avg_salary": 189154.5
  },
  {
    "skill": "watson",
    "avg_salary": 160515
  },
  {
    "skill": "couchbase",
    "avg_salary": 160515
  },
  {
    "skill": "datarobot",
    "avg_salary": 155485.5
  },
  {
    "skill": "gitlab",
    "avg_salary": 154500
  },
  {
    "skill": "swift",
    "avg_salary": 153750
  },
  {
    "skill": "jupyter",
    "avg_salary": 152776.5
  },
  {
    "skill": "pandas",
    "avg_salary": 151821.33
  },
  {
    "skill": "elasticsearch",
    "avg_salary": 145000
  }
]
*/