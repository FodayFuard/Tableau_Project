/*Questions: 1.	What are the top paying jobs in the US?
    -What are the highest paying jobs in the US?
    -Which companies are these jobs from?
    -Only include jobs that have a salary value
    -Only include relevant columns*/

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

ORDER BY salary_year_avg DESC;