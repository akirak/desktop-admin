PWD = $(shell pwd)
docker_run = docker run -v ${PWD}:/tmp/playbook -w /tmp/playbook
docker_tag = akirak-desktop

test:
			docker build -t ${docker_tag} .

# base:
# 		 docker build -t ${docker_tag}:arch-base -f arch-base.dockerfile .

# root: base
# 			docker build -t ${docker_tag}:arch-root -f arch-root.dockerfile .

# user:
# 		 ansible-playbook -i localhost, -c local \
# 				-e playbook_dir=${PWD} \
# 				playbook.yml

# test:
# 		  ${docker_run} akirak/arch-ansible \
# 				ansible-playbook -i localhost, -c local playbook.yml

# test_user_arch:
# 			${docker_run} arch-ansible-user-test

# build_user_arch_test:
# 			docker build -t arch-ansible-user-test -f user-arch.dockerfile .

# test_user_arch_rebuild: build_user_arch_test test_user_arch
