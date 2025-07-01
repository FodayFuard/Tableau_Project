--.Question: What are the top skills based on average salary for jobs in the US?

SELECT
    skills2.skills AS skills_required,
    ROUND(AVG(job.salary_year_avg),0) AS average_salary

FROM job_postings2 AS job
    
JOIN skills_job2 ON job.job_id = skills_job2.job_id
JOIN skills2 ON skills_job2.skill_id = skills2.skill_id

WHERE
    job_country = 'United States'
    AND salary_year_avg IS NOT NULL

GROUP BY
    skills

ORDER BY
    average_salary DESC;