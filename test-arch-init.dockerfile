FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN mkdir /tmp/playbook
COPY ./root-init.sh /tmp/playbook
COPY ./init.yml /tmp/playbook
WORKDIR /tmp/playbook
RUN bash ./root-init.sh --skip-tags=graphical

COPY . /tmp/playbook
RUN ansible-playbook -c local --tags=graphical init.yml
