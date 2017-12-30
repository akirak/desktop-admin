FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN pacman -Sy --noconfirm ansible

RUN mkdir /tmp/playbook
COPY root /tmp/playbook
WORKDIR /tmp/playbook
RUN ansible-playbook -i localhost, -c local \
      -e user_name=test playbook.yml

USER test
ENV HOME /home/test
RUN mkdir $HOME/admin

CMD ansible-playbook -i localhost, -c local \
      -e ansible_python_interpreter=/usr/bin/python2 \
      -e playbook_dir=$HOME/admin/user \
      --skip-tags=x11 \
      playbook.yml
