FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN pacman -Sy --needed --noconfirm git

RUN mkdir /tmp/playbook
COPY ./root-init.sh /tmp/playbook
COPY ./init.yml /tmp/playbook
WORKDIR /tmp/playbook
RUN bash ./root-init.sh --skip-tags=graphical

USER arch
ENV HOME /home/arch
COPY --chown=arch:arch . $HOME/admin

WORKDIR $HOME/admin

CMD ansible-playbook -c local \
    -e playbook_dir=$HOME/admin \
    --skip-tags=x11 \
    apps.yml
