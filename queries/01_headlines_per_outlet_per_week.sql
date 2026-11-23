-- Data check: some feeds include old articles (e.g. a Dawn headline from 2022),
-- so every query only counts headlines published after collection started.

-- Q1: How many headlines does each outlet publish per week?
SELECT outlet,
       strftime('%Y-%W', COALESCE(published, fetched_at)) AS week,
       COUNT(*) AS headlines
FROM headlines
WHERE COALESCE(published, fetched_at) >= (SELECT DATE(MIN(fetched_at)) FROM headlines)
GROUP BY outlet, week
ORDER BY week, headlines DESC;

-- Q1b: Average headlines per week, by outlet
SELECT outlet,
       COUNT(*) AS headlines,
       COUNT(DISTINCT strftime('%Y-%W', COALESCE(published, fetched_at))) AS weeks,
       ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT strftime('%Y-%W', COALESCE(published, fetched_at))), 1) AS avg_per_week
FROM headlines
WHERE COALESCE(published, fetched_at) >= (SELECT DATE(MIN(fetched_at)) FROM headlines)
GROUP BY outlet
ORDER BY avg_per_week DESC;
