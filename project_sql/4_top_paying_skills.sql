SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_skill_salary
FROM job_postings_fact
INNER JOIN
    skills_job_dim AS job_skills ON job_skills.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim ON job_skills.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_country = 'Singapore' AND
    job_title NOT LIKE '%Research_Scientist%'
GROUP BY   
    skills
ORDER BY avg_skill_salary DESC
LIMIT 25

/*
[
  {
    "skills": "looker",
    "avg_skill_salary": "111175"
  },
  {
    "skills": "linux",
    "avg_skill_salary": "109500"
  },
  {
    "skills": "word",
    "avg_skill_salary": "105838"
  },
  {
    "skills": "powerpoint",
    "avg_skill_salary": "105838"
  },
  {
    "skills": "flow",
    "avg_skill_salary": "105558"
  },
  {
    "skills": "excel",
    "avg_skill_salary": "100569"
  },
  {
    "skills": "pandas",
    "avg_skill_salary": "100500"
  },
  {
    "skills": "zoom",
    "avg_skill_salary": "100500"
  },
  {
    "skills": "slack",
    "avg_skill_salary": "100500"
  },
  {
    "skills": "qlik",
    "avg_skill_salary": "100500"
  },
  {
    "skills": "sas",
    "avg_skill_salary": "100500"
  },
  {
    "skills": "numpy",
    "avg_skill_salary": "100500"
  },
  {
    "skills": "spss",
    "avg_skill_salary": "99500"
  },
  {
    "skills": "javascript",
    "avg_skill_salary": "98500"
  },
  {
    "skills": "r",
    "avg_skill_salary": "94676"
  },
  {
    "skills": "python",
    "avg_skill_salary": "94525"
  },
  {
    "skills": "tableau",
    "avg_skill_salary": "92856"
  },
  {
    "skills": "aws",
    "avg_skill_salary": "92435"
  },
  {
    "skills": "sql",
    "avg_skill_salary": "86853"
  },
  {
    "skills": "power bi",
    "avg_skill_salary": "84044"
  },
  {
    "skills": "hadoop",
    "avg_skill_salary": "81225"
  },
  {
    "skills": "outlook",
    "avg_skill_salary": "79200"
  },
  {
    "skills": "spark",
    "avg_skill_salary": "78088"
  },
  {
    "skills": "azure",
    "avg_skill_salary": "72750"
  },
  {
    "skills": "gcp",
    "avg_skill_salary": "72750"
  }
]
*/