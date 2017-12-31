PWD = $(shell pwd)
OPTIONS = ""

install:
				ansible-playbook -c local -e playbook_dir=$PWD $OPTIONS apps.yml
