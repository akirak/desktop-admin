FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

RUN pacman -Sy --needed --noconfirm git

RUN mkdir /tmp/playbook
COPY init.yml install.bash /tmp/playbook/
WORKDIR /tmp/playbook
RUN bash ./install.bash --skip-tags=graphical

USER arch
ENV HOME /home/arch
COPY --chown=arch:arch . $HOME/admin

WORKDIR $HOME/admin

CMD bash ./install.bash --skip-tags=x11
