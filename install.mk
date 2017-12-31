PWD = $(shell pwd)
OPTIONS = ""

install:
	if [ $(shell whoami) == "root" ]; then \
		bash ./root-init.sh \
	else \
		ansible-playbook -c local -e playbook_dir=$PWD $OPTIONS apps.yml \
	fi
