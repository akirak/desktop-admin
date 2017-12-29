FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN pacman -Sy --noconfirm ansible

CMD ansible-playbook -i localhost, -c local playbook.yml
