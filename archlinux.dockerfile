FROM archimg/base:full

MAINTAINER Akira Komamura <akira.komamura@gmail.com>

ARG root-options
ARG user-options

RUN pacman -Sy --needed --noconfirm git

RUN mkdir /tmp/playbook
COPY init.yml install.bash /tmp/playbook/
RUN mkdir /tmp/playbook/roles
COPY roles/x-server /tmp/playbook/roles/x-server
WORKDIR /tmp/playbook
RUN bash ./install.bash ${root_options}

USER arch
ENV HOME /home/arch
COPY --chown=arch:arch . $HOME/admin

WORKDIR $HOME/admin

RUN bash ./install.bash ${user_options}
