#!/bin/bash

config_file=$HOME/.files

# Get options from an external config file
if [ -f ${config_file} ]; then
    options=$(cat ${config_file})
else
    options=""
fi

# Get a python interpreter for Ansible
if [ -f /etc/arch-release ]; then
    echo "The target operating system is Arch Linux."
    python_interpreter=/usr/bin/python2
else
    python_interpreter=`which python2` ||
        python_interpreter=`which python` ||
        exit 1
fi

# Run Ansible to deploy applications and configuration files
exec ansible-playbook -i localhost, -c local \
     -e playbook_dir=$PWD \
     -e ansible_python_interpreter=${python_interpreter} \
     ${options} \
     playbook.yml
