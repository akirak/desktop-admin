FROM alpine

RUN apk add --no-cache shadow ansible

RUN groupadd test
RUN useradd -g test -m -d /home/test test
USER test
ENV HOME /home/test

COPY --chown=test:test . /tmp/playbook

WORKDIR /tmp/playbook
RUN ansible-playbook -i localhost, -c local test-emacs-pg.yml
