/*Questions: 1. What are the skills required for these top-paying roles?
    -Use the results from the previous one
    -Just add the skills needed*/
   
WITH top_paying_US_jobs AS (
SELECT
    job.job_id,
    job.company_id,
    job.job_title_short,
    company2.name,
    job.job_location,
    job.job_via,
    job.job_schedule_type,
    job.job_work_from_home,
    job.search_location,
    job.job_posted_date,
    job.job_no_degree_mention,
    job.job_health_insurance,
    job.job_country,
    ROUND(job.salary_year_avg,0) AS yearly_salary

FROM job_postings2 AS job

LEFT JOIN company2 ON job.company_id = company2.company_id

WHERE
    salary_year_avg IS NOT NULL
    AND job_location = 'United States'

ORDER BY salary_year_avg DESC)

SELECT 
    top_paying_US_jobs.*,
    skills2.skills AS skills_required

FROM top_paying_US_jobs

JOIN skills_job2 ON top_paying_US_jobs.job_id = skills_job2.job_id
JOIN skills2 ON skills_job2.skill_id = skills2.skill_id

ORDER BY yearly_salary DESC;