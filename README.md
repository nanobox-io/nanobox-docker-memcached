# Memcached
This is an Memcached image used to launch Memcached components on Nanobox.

## Memcached Configuration Options
Memcached components are configured in the `boxfile.yml`. All available configuration options are outlined below.

###### Quick Links
[version](#version)  
[memcached\_return\_error\_on\_memory\_exhausted](#return-error-on-memory-exhausted)  
[memcached\_max\_connections](#max-connections)  
[memcached\_chunk\_size\_growth\_factor](#chunk-size-growth-factor)  
[memcached\_minimum\_allocated\_space](#minimum-allocated-space)  
[memcached\_maximum\_requests\_per\_event](#maximum-requests-per-event)  
[memcached\_disable\_cas](#disable-cas)  
[memcached\_max\_backlog](#max-backlog)  
[memcached\_binding\_protocol](#binding-protocol)

#### Overview of Memcached Boxfile Settings
```yaml
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    version: 1.4
    memcached_return_error_on_memory_exhausted: false
    memcached_max_connections: 1024
    memcached_chunk_size_growth_factor: 1.25
    memcached_minimum_allocated_space: 48
    memcached_maximum_requests_per_event: 20
    memcached_disable_cas: false
    memcached_max_backlog: 1024
    memcached_binding_protocol: 'auto'
```

### Version
When configuring a Memcached component in your Boxfile, you can specify which version to use. The following version(s) are available:

- 1.4

**Note:** Due to version compatibility constraints, memcached versions cannot be changed after the component is created. To use a different version, you'll have to create a new Memcached component.

#### version
```yaml
# default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    version: 1.4
```

### Return Error on Memory Exhausted
This allows you to have memcached return an error when memory is exhausted rather than removing items.

#### memcached\_return\_error\_on\_memory\_exhausted
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_return_error_on_memory_exhausted: false
```

### Max Connections
Sets the limit for simultaneous connections.

#### memcached\_max\_connections
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_max_connections: 1024
```

### Chunk Size Growth Factor
Specifies the chunk size growth factor.

#### memcached\_chunk\_size\_growth\_factor
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_chunk_size_growth_factor: 1.25
```

### Minimum Allocated Space
Sets the minimum space allocated for key+value+flags.

#### memcached\_minimum\_allocated\_space
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_minimum_allocated_space: 48
```

### Maximum Requests Per Event
Sets the maximum number of requests per event and limits the number of requests processed for a given connection to prevent starvation.

#### memcached\_maximum\_requests\_per\_event
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_maximum_requests_per_event: 20
```

### Disable CAS
Allows you to disable the use of [CAS](https://code.google.com/p/memcached/wiki/NewCommands#cas).

#### memcached\_disable\_cas
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_disable_cas: false
```

### Max Backlog
Sets the backlog queue limit.

#### memcached\_max\_backlog
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_max_backlog: 1024
```

### Binding Protocol
Allows you to set the binding protocol. The following are available:

- auto
- ascii
- binary

#### memcached\_binding\_protocol
```yaml
#default setting
data:
  image: nanobox-io/nanobox-docker-memcached
  config:
    memcached_binding_protocol: 'auto'
```

## Help & Support
This is a Memcached image provided by [Nanobox](http://nanobox.io). If you need help with this image, you can reach out to us in the [#nanobox IRC channel](http://webchat.freenode.net/?channels=nanobox). If you are running into an issue with the image, feel free to [create a new issue on this project](https://github.com/nanobox-io/nanobox-docker-memcached/issues/new).

## License

Mozilla Public License, version 2.0
