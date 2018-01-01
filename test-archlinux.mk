ARCH_DOCKER_TAG = akirak/linux-playbook:arch

all: user graphical

user: init
			docker run $(ARCH_DOCKER_TAG)-init

graphical: init
					docker run -u root \
						$(ARCH_DOCKER_TAG)-init \
						ansible-playbook -c local --tags=graphical init.yml

init:
			docker build -t $(ARCH_DOCKER_TAG)-init -f archlinux.dockerfile .

full:
		docker build -t $(ARCH_DOCKER_TAG)-full -f archlinux-full.dockerfile .
