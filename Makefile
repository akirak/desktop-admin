PWD = $(shell pwd)
arch_docker_tag = akirak-arch

test-arch: test-arch-user test-arch-graphical

test-arch-user: test-arch-init
								docker run ${arch_docker_tag}:init

test-arch-graphical: test-arch-init
										 docker run -u root \
												${arch_docker_tag}:init \
												ansible-playbook -c local --tags=graphical init.yml

test-arch-init:
								docker build -t ${arch_docker_tag}:init -f arch-init.dockerfile .
