
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

template '/etc/service/cache/run' do
  mode 0755
  variables ({ exec: "/data/bin/memcached -m 128 -c 1024 -f 1.25 -n 48 -R 20 -b 1024 -B auto 2>&1" })
end

# Configure narc
template '/opt/gonano/etc/narc.conf' do
  variables ({ uid: payload[:uid], app: "nanobox", logtap: payload[:logtap_uri] })
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
