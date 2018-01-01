#!/bin/bash

function set_password() {
    user=$1
    if [[ "$-" == "*i*" ]]; then
        passwd $user
    else
        echo "WARNING: The init script is not running an interactive shell, so no password is set on the user."
        echo "Don't forget to set a password. "
    fi
}

function init_archlinux() {
    NEW_USER=arch
    pacman -Sy --noconfirm --needed python2 ansible openssh sudo git \
        && echo "localhost ansible_python_interpreter=/usr/bin/python2 ansible_connection=local" \
                >> /etc/ansible/hosts \
        && ansible-playbook -c local -e user_name=${NEW_USER} "$@" init.yml \
        && set_password ${NEW_USER}
}

function install_root() {
    if [[ -f /etc/arch-release ]]; then
        echo "The target operating system is Arch Linux."
        init_archlinux "$@"
    else
        echo "Unsupported operating system" >&2
        exit 1
    fi
}

function install_user() {
    ansible-playbook -c local -e playbook_dir=$PWD "$@" apps.yml
}

if [[ `whoami` == "root" ]]; then
    install_root "$@"
else
    install_user "$@"
fi
