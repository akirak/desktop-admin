PWD = $(shell pwd)
arch_docker_tag = akirak-arch

test-arch: test-arch-user test-arch-graphical

test-arch-user: test-arch-init
								docker run akirak-arch:init

test-arch-graphical: test-arch-init
										 docker run -ti \
												-v ${PWD}:/tmp/playbook -w /tmp/playbook \
												akirak-arch:init \
												ansible-playbook -c local --tags=graphical init.yml

test-arch-init:
								docker build -t akirak-arch:init -f arch-init.dockerfile .
