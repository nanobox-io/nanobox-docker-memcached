# -*- mode: make; tab-width: 4; -*-
# vim: ts=4 sw=4 ft=make noet
all: build publish

LATEST:=1.4
stability?=latest
version?=$(LATEST)
dockerfile?=Dockerfile-$(version)

login:
	@vagrant ssh -c "docker login"

build:
	@echo "Building 'memcached' image..."
	@vagrant ssh -c "docker build -f /vagrant/Dockerfile-${version} -t nanobox/memcached /vagrant"

publish:
	@echo "Tagging 'memcached:${version}-${stability}' image..."
	@vagrant ssh -c "docker tag -f nanobox/memcached nanobox/memcached:${version}-${stability}"
	@echo "Publishing 'memcached:${version}-${stability}'..."
	@vagrant ssh -c "docker push nanobox/memcached:${version}-${stability}"
ifeq ($(version),$(LATEST))
	@echo "Publishing 'memcached:${stability}'..."
	@vagrant ssh -c "docker tag -f nanobox/memcached nanobox/memcached:${stability}"
	@vagrant ssh -c "docker push nanobox/memcached:${stability}"
endif

clean:
	@echo "Removing all images..."
	@vagrant ssh -c "for image in \$$(docker images -q); do docker rmi -f \$$image; done"