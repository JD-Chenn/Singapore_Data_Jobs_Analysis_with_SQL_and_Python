WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        job_location,
        salary_year_avg
    FROM job_postings_fact

    LEFT JOIN
        company_dim ON company_dim.company_id = job_postings_fact.company_id

    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_country = 'Singapore' AND
        job_title NOT LIKE '%Research_Scientist%'

    ORDER BY
        salary_year_avg DESC

    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills AS skill_name
FROM top_paying_jobs
INNER JOIN
    skills_job_dim AS job_skills ON job_skills.job_id = top_paying_jobs.job_id
INNER JOIN
    skills_dim ON job_skills.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC