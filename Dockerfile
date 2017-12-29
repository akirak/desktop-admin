FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN pacman -Sy --noconfirm ansible

RUN mkdir /tmp/playbook
COPY root /tmp/playbook
WORKDIR /tmp/playbook
RUN ansible-playbook -i localhost, -c local \
      -e user_name=test playbook.yml

# FROM root

# USER test
# COPY . /home/user/admin

# WORKDIR /home/user/admin
# RUN ansible-playbook -i localhost, -c local \
#       -e ansible_python_interpreter=/usr/bin/python2 \
#       -e playbook_dir=/home/user/admin \
#       --skip-tags=x11 \
#       user-playbook.yml
