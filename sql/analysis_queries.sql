-- Inspect table structure
PRAGMA table_info(events);

-- Preview data
SELECT * FROM events
LIMIT 5;

-- Average attendance rate by event
SELECT
    event_type,
    ROUND(AVG(attendance_rate), 2) AS avg_attendance_rate,
    COUNT(*) AS num_events
FROM events
GROUP BY event_type
ORDER BY avg_attendance_rate DESC;

-- Cost efficiency by event
SELECT
    event_type,
    ROUND(AVG(cost_per_attendee), 2) AS avg_cost_per_attendee
FROM events
GROUP BY event_type
ORDER BY avg_cost_per_attendee;

-- High effort, low return events
SELECT
    event_name,
    event_type,
    num_organisers,
    attendance_rate,
    cost_per_attendee
FROM events
WHERE num_organisers >= 20
  AND attendance_rate < 1
ORDER BY cost_per_attendee DESC;

-- Weather impact
SELECT
    weather_condition,
    ROUND(AVG(attendance_rate), 2) AS avg_attendance_rate,
    COUNT(*) AS num_events
FROM events
GROUP BY weather_condition;
