SELECT table, round(sum(bytes) / 1024/1024/1024, 2) as size_gb 
FROM system.parts 
group by table;

SELECT partition, round(sum(bytes) / 1024/1024/1024, 2) as size_gb 
FROM system.parts 
group by partition;

SELECT database, round(sum(bytes) / 1024/1024/1024, 2) as size_gb 
FROM system.parts 
group by database;
