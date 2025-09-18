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
    salary_year_avg IS NOT NULL
GROUP BY   
    skills
ORDER BY avg_skill_salary DESC
LIMIT 25