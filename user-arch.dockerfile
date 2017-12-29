MAINTAINER Akira Komamura <akira.komamura@gmail.com>

FROM archimg/base:full as ansible
RUN pacman -Sy --noconfirm ansible

# FROM akirak/arch-ansible
# RUN pacman -Sy --noconfirm shadow sudo fakeroot

FROM ansible

# Create a user with a home directory
RUN useradd -m test
# Allow the user to sudo without password
RUN echo "test ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER test

CMD ansible-playbook -i localhost, -c local \
    -e ansible_python_interpreter=/usr/bin/python2 \
    -e playbook_dir=$PWD \
    --skip-tags=x11,package \
    user-playbook.yml
