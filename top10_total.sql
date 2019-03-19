SELECT * FROM(
SELECT s.UID, getname(s.UID) Name, sum(s.Call_time) Total_call_time, sum(CAST((s.Call_time * s.Tarif) AS DECIMAL(10,2))) Total_price FROM (
SELECT
(TIME_TO_SEC(TIME(Timestamp_end))-TIME_TO_SEC(TIME(Timestamp_start))) Call_time,
pr(cl.To) Num,
cl.Timestamp_start,
cl.Timestamp_end,
cl.Call_dir,
cl.UID,
numb(pr(cl.To),cl.Call_dir) Tarif
FROM Dino.Call_logs cl
) s
GROUP BY s.UID
ORDER BY Total_price DESC
LIMIT 10) AS ls
INNER JOIN (
SELECT ss.UID,  MINUTE(TIME(ss.Timestamp_start)) Date, sum(ss.Call_time) Call_time_per_day, sum(CAST((ss.Call_time * ss.Tarif) AS DECIMAL(10,2))) Total_per_day FROM (
SELECT
(TIME_TO_SEC(TIME(Timestamp_end))-TIME_TO_SEC(TIME(Timestamp_start))) Call_time,
pr(cll.To) Num,
cll.Timestamp_start,
cll.Timestamp_end,
cll.Call_dir,
cll.UID,
numb(pr(cll.To),cll.Call_dir) Tarif
FROM Dino.Call_logs cll
) ss
GROUP BY ss.UID, Date
ORDER BY Total_per_day DESC
) rs
ON (ls.UID=rs.UID)



