FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN pacman -Sy --needed --noconfirm git make

RUN mkdir /tmp/playbook
COPY ./root-init.sh /tmp/playbook
COPY ./init.yml /tmp/playbook
WORKDIR /tmp/playbook
RUN make install

USER arch
ENV HOME /home/arch
COPY --chown=arch:arch . $HOME/admin

WORKDIR $HOME/admin

RUN make install
