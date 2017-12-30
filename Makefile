PWD = $(shell pwd)
docker_tag = akirak-desktop:arch

test: build
			docker run -ti \
				-v ${PWD}/user:/home/test/admin/user -w /home/test/admin/user \
				${docker_tag}

build:
			docker build -t ${docker_tag} .
