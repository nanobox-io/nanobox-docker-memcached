<?php
if (isset($_SERVER['MEMCACHED1_HOST'])) {
    $memcache = new Memcache;
    $memcache->addServer($_SERVER['MEMCACHED1_HOST'], $_SERVER['MEMCACHED1_PORT'] );
    $memcache->set("test_key", "test_value");
    $value = $memcache->get("test_key");
    if ($value == "test_value") {
        echo "Test Succeeded";
    }
    else {
    header("Status: 404 Not Found");
    }
}
else {
header("Status: 500 Internal Server Error");
}
?>