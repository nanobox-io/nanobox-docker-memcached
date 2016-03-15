# source docker helpers
. util/docker.sh

@test "Start Container" {
  start_container "memcached-test"
}

@test "Verify memcached installed" {
  # ensure memcached executable exists
  run docker exec "memcached-test" bash -c "[ -f /data/bin/memcached ]"

  [ "$status" -eq 0 ]
}

@test "Stop Container" {
  stop_container "memcached-test"
}
