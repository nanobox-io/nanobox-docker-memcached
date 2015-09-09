all: image tag

image:
	@vagrant up
	@vagrant ssh -c "sudo docker build -t nanobox/memcached /vagrant"

tag:
	@vagrant ssh -c "sudo docker tag -f nanobox/memcached nanobox/memcached:1.4"
	@vagrant ssh -c "sudo docker tag -f nanobox/memcached nanobox/memcached:1.4-stable"
	@vagrant ssh -c "sudo docker tag -f nanobox/memcached nanobox/memcached:1.4-beta"
	@vagrant ssh -c "sudo docker tag -f nanobox/memcached nanobox/memcached:1.4-alpha"

publish:
	@vagrant ssh -c "sudo docker push nanobox/memcached"
	@vagrant ssh -c "sudo docker push nanobox/memcached:1.4"
	@vagrant ssh -c "sudo docker push nanobox/memcached:1.4-stable"

push_14_stable:
	@vagrant ssh -c "sudo docker push nanobox/memcached"
	@vagrant ssh -c "sudo docker push nanobox/memcached:1.4"
	@vagrant ssh -c "sudo docker push nanobox/memcached:1.4-stable"

push_14_beta:
	@vagrant ssh -c "sudo docker push nanobox/memcached:1.4-beta"

push_14_alpha:
	@vagrant ssh -c "sudo docker push nanobox/memcached:1.4-alpha"

clean:
	@vagrant destroy -f
