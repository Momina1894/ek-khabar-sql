-- Q1: How many headlines does each outlet publish per week?
SELECT outlet,
       strftime('%Y-%W', fetched_at) AS week,
       COUNT(*) AS headlines
FROM headlines
GROUP BY outlet, week
ORDER BY week, headlines DESC;
