-- Q2a: How many stories were covered by 1 outlet, 2 outlets, 3 outlets...?
WITH per_story AS (
  SELECT s.story_id,
         COUNT(DISTINCT h.outlet) AS outlets
  FROM stories s
  JOIN headlines h ON h.id = s.headline_id
  GROUP BY s.story_id
)
SELECT outlets,
       COUNT(*) AS stories
FROM per_story
GROUP BY outlets
ORDER BY outlets;

-- Q2b: The 20 stories covered by the most outlets
SELECT s.story_id,
       COUNT(DISTINCT h.outlet) AS outlets,
       COUNT(*) AS headlines,
       MIN(h.title) AS example_headline,
       MIN(COALESCE(h.published, h.fetched_at)) AS first_seen
FROM stories s
JOIN headlines h ON h.id = s.headline_id
GROUP BY s.story_id
ORDER BY outlets DESC, headlines DESC
LIMIT 20;
