PWD = $(shell pwd)
arch_docker_tag = akirak-desktop:arch

test-arch:
			docker build -t ${arch_docker_tag} -f test-archlinux.dockerfile . && \
			docker run -ti \
				-v ${PWD}/user:/home/test/admin/user -w /home/test/admin/user \
				${arch_docker_tag}

test-arch-init:
								docker run -v ${PWD}:/tmp/playbook -w /tmp/playbook \
										archimg/base:full bash ./root-init.sh
