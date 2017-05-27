#!/bin/sh
git submodule update --depth 1 --recursive \
    && ansible-playbook -i localhost -c local -e user_name=`whoami` playbook.yml \
    && { [ $SHELL = /bin/zsh ] || chsh -s /bin/zsh; }
