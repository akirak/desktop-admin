FROM akirak-desktop:arch-base

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN mkdir /tmp/playbook
RUN COPY . /tmp/playbook
WORKDIR /tmp/playbook
RUN ansible-playbook -i localhost, -c local root-playbook.yml
