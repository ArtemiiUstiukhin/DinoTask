SELECT s.UID, getname(s.UID) Name, sum(s.Call_time) Call_time, sum(CAST((s.Call_time * s.Tarif) AS DECIMAL(10,2))) Total FROM (
SELECT
(TIME_TO_SEC(TIME(Timestamp_end))-TIME_TO_SEC(TIME(Timestamp_start))) Call_time,
pr(cl.To) Num,
cl.Timestamp_start,
cl.Timestamp_end,
cl.Call_dir,
cl.UID,
numb(pr(cl.To),cl.Call_dir) Tarif
FROM Dino.Call_logs cl) s
GROUP BY s.UID
ORDER BY Call_time DESC
LIMIT 10;


