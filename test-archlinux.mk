ARCH_DOCKER_TAG = akirak/linux-playbook:arch

# The first target will become a job run with 'make test-archlinux' (see Makefile)

user:
		docker build -f archlinux.dockerfile \
			--build-arg root-options=--skip-tags=graphical \
			--build-arg user-options=--skip-tags=x11 \
			.

full:
		docker build -f archlinux.dockerfile .
