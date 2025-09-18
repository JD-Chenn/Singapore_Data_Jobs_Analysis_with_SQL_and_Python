SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_skill_salary,
    COUNT(job_postings_fact.job_id) AS job_count
FROM job_postings_fact
INNER JOIN
    skills_job_dim AS job_skills ON job_skills.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim ON job_skills.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_title NOT LIKE '%Research_Scientist%'
GROUP BY   
    skills
HAVING
    COUNT(job_postings_fact.job_id) > 100
ORDER BY 
    avg_skill_salary DESC,
    job_count DESC
LIMIT 25

/*
[
  {
    "skills": "databricks",
    "avg_skill_salary": "112881",
    "job_count": "102"
  },
  {
    "skills": "spark",
    "avg_skill_salary": "112404",
    "job_count": "184"
  },
  {
    "skills": "snowflake",
    "avg_skill_salary": "111578",
    "job_count": "241"
  },
  {
    "skills": "hadoop",
    "avg_skill_salary": "110888",
    "job_count": "140"
  },
  {
    "skills": "nosql",
    "avg_skill_salary": "108331",
    "job_count": "108"
  },
  {
    "skills": "jira",
    "avg_skill_salary": "107737",
    "job_count": "143"
  },
  {
    "skills": "aws",
    "avg_skill_salary": "106416",
    "job_count": "289"
  },
  {
    "skills": "alteryx",
    "avg_skill_salary": "105580",
    "job_count": "124"
  },
  {
    "skills": "azure",
    "avg_skill_salary": "105260",
    "job_count": "318"
  },
  {
    "skills": "looker",
    "avg_skill_salary": "103855",
    "job_count": "260"
  },
  {
    "skills": "python",
    "avg_skill_salary": "101181",
    "job_count": "1828"
  },
  {
    "skills": "oracle",
    "avg_skill_salary": "100964",
    "job_count": "332"
  },
  {
    "skills": "java",
    "avg_skill_salary": "99845",
    "job_count": "134"
  },
  {
    "skills": "r",
    "avg_skill_salary": "98579",
    "job_count": "1070"
  },
  {
    "skills": "flow",
    "avg_skill_salary": "98020",
    "job_count": "271"
  },
  {
    "skills": "tableau",
    "avg_skill_salary": "97978",
    "job_count": "1659"
  },
  {
    "skills": "ssis",
    "avg_skill_salary": "97235",
    "job_count": "102"
  },
  {
    "skills": "sql",
    "avg_skill_salary": "96435",
    "job_count": "3083"
  },
  {
    "skills": "go",
    "avg_skill_salary": "96215",
    "job_count": "284"
  },
  {
    "skills": "sql server",
    "avg_skill_salary": "96191",
    "job_count": "336"
  },
  {
    "skills": "vba",
    "avg_skill_salary": "93845",
    "job_count": "185"
  },
  {
    "skills": "sas",
    "avg_skill_salary": "93707",
    "job_count": "1000"
  },
  {
    "skills": "sap",
    "avg_skill_salary": "92446",
    "job_count": "183"
  },
  {
    "skills": "power bi",
    "avg_skill_salary": "92324",
    "job_count": "1044"
  },
  {
    "skills": "javascript",
    "avg_skill_salary": "91805",
    "job_count": "153"
  }
]
*/