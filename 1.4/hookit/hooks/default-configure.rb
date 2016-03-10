
include Hooky::Memcached

if payload[:platform] == 'local'
  maxmemory = 128
else
  maxmemory = payload[:member][:schema][:meta][:ram].to_i / 1024 / 1024
end

# Setup
converged_boxfile = converge( Hooky::Memcached::BOXFILE_DEFAULTS, payload[:boxfile] )

# Import service (and start)
directory '/etc/service/cache' do
  recursive true
end

directory '/etc/service/cache/log' do
  recursive true
end

template '/etc/service/cache/log/run' do
  mode 0755
  source 'log-run.erb'
  variables ({ svc: "cache" })
end

mem_exec = "/data/bin/memcached \
-m #{maxmemory} \
-c #{converged_boxfile[:max_connections]} \
-f #{converged_boxfile[:chunk_size_growth_factor]} \
-n #{converged_boxfile[:minimum_allocated_space]} \
-R #{converged_boxfile[:maximum_requests_per_event]} \
-b #{converged_boxfile[:max_backlog]} \
-B #{converged_boxfile[:binding_protocol]} \
   #{converged_boxfile[:return_error_on_memory_exhausted] ? '-M' : ''} \
   #{converged_boxfile[:disable_cas] ? '-C' : ''}"

template '/etc/service/cache/run' do
  mode 0755
  variables ({ exec: mem_exec })
end

# Configure narc
template '/opt/gonano/etc/narc.conf' do
  variables ({ uid: payload[:uid], app: "nanobox", logtap: payload[:logtap_host] })
end

directory '/etc/service/narc'

file '/etc/service/narc/run' do
  mode 0755
  content <<-EOF
#!/bin/sh -e
export PATH="/opt/local/sbin:/opt/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/gonano/sbin:/opt/gonano/bin"

exec /opt/gonano/bin/narcd /opt/gonano/etc/narc.conf
  EOF
end
