/* What are the most in demand skills for jobs in the US?
    -Count of skills required for jobs postings*/

SELECT
    skills2.skills AS skills_required,
    COUNT(skills_job2.job_id) AS skills_demanded_count

FROM job_postings2 AS job
    
JOIN skills_job2 ON job.job_id = skills_job2.job_id
JOIN skills2 ON skills_job2.skill_id = skills2.skill_id

WHERE
    job_country = 'United States'

GROUP BY
    skills

ORDER BY
    skills_demanded_count DESC;