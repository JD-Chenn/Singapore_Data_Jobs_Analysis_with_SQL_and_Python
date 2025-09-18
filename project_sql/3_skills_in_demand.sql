SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS job_count
FROM job_postings_fact
INNER JOIN
    skills_job_dim AS job_skills ON job_skills.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim ON job_skills.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'Singapore' AND
    job_title NOT LIKE '%Research_Scientist%'
GROUP BY   
    skills
ORDER BY job_count DESC
LIMIT 5

/*
[
  {
    "skills": "sql",
    "job_count": "3664"
  },
  {
    "skills": "python",
    "job_count": "3106"
  },
  {
    "skills": "excel",
    "job_count": "2308"
  },
  {
    "skills": "tableau",
    "job_count": "2216"
  },
  {
    "skills": "r",
    "job_count": "1324"
  }
]
*/