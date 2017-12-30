PWD = $(shell pwd)
arch_docker_tag = akirak-desktop:arch

test-arch:
			docker build -t ${arch_docker_tag} -f test-archlinux.dockerfile . && \
			docker run -ti \
				-v ${PWD}/user:/home/test/admin/user -w /home/test/admin/user \
				${arch_docker_tag}

test-arch-init:
								docker build -f test-arch-init.dockerfile .
