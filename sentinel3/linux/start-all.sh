redis_server=redis-server
redis_sentinel=redis-sentinel
redis_cli=redis-cli

$redis_server server-6380/redis.conf &
$redis_sentinel server-6380/sentinel.conf &

$redis_server server-6381/redis.conf &
$redis_sentinel server-6381/sentinel.conf &

$redis_server server-6382/redis.conf &
$redis_sentinel server-6382/sentinel.conf &

read -n1 -r -p "Press any key to see sentinel info on masters and slaves..."

$redis_cli -p 26380 sentinel master mymaster
$redis_cli -p 26381 sentinel slaves mymaster
