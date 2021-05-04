select formatReadableSize(sum(bytes_allocated)) from system.dictionaries;

SELECT
    database,
    name,
    formatReadableSize(total_bytes)
FROM system.tables
WHERE engine in ('Memory','Set','Join');

select formatReadableSize(sum(memory_usage)) from system.merges;

select formatReadableSize(sum(memory_usage)) from system.processes;

SELECT
    initial_query_id,
    formatReadableSize(memory_usage),
    formatReadableSize(peak_memory_usage),
    query
FROM system.processes
ORDER BY peak_memory_usage DESC
LIMIT 10;

SELECT
    metric,
    formatReadableSize(value)
FROM system.asynchronous_metrics
WHERE metric IN ('UncompressedCacheBytes', 'MarkCacheBytes');

SELECT
    formatReadableSize(sum(primary_key_bytes_in_memory)) AS primary_key_bytes_in_memory,
    formatReadableSize(sum(primary_key_bytes_in_memory_allocated)) AS primary_key_bytes_in_memory_allocated
FROM system.parts;

SELECT
    initial_query_id,
    formatReadableSize(memory_usage),
    query
FROM system.query_log
WHERE (event_date >= today()) AND (event_time >= (now() - 7200))
ORDER BY memory_usage DESC
LIMIT 10;
