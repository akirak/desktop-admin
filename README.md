Ansible Playbooks for Configuring a Linux Desktop
==================

This repository contains Ansible playbooks for configuring a Linux machine.

## Features

This repository consists of two playbooks: one for the root user and another for a normal user. 

### Playbook for the root

[The root playbook](init.yml) must be run as the root user in the very beginning of installation. Like cloud-init, it creates the default user for an operating system and optionally deploys X Window System. 

This playbook currently supports only Arch Linux, as most *desktop* operating systems ship with a graphical environment and force you to create at least one normal user. 

### Playbook for a user

Another playbook should be run as a user. It deploys the following programs and configuration files. 

- Zsh
- Environment variables for Emacs and Chrome
- Input methods for Japanese and Chinese
- Add multilib, archlinuxfr, and archlinuxcn repositories for Arch Linux pacman

In terms of playbook organization, it has made the following progress. 

- The entire playbook is rewritten. It is neatly organized using pre-tasks and roles. 
- Tags are added to each role so that you can select features you need. 
- A generic package module of Ansible is used to install common packages. Hopefully, it supports other Linux distributions out of the box. 
- For more specific packages such as utilities, tasks are conditionally run or just skipped in unsupported operating systems. 

## Supported platforms

This root playbook supports only Arch Linux.

The user playbook is currently tested on Arch Linux but may support other Linux distributions in the future. 

## Usage

### Create a user and deploy a graphical environment

This repository contains a script for creating a user and installing X Window System on Arch Linux:

```
bash ./root-init.sh
```

If you don't want to install the graphical environment using this playbook, add `--skip-tags=x-server` option:

```
bash ./root-init.sh --skip-tags=x-server
```

### Install applications as a user

This repository contains a Makefile for installing application. Run `make install` as a user:

```
make install
```

## Development

You can use make to test the playbooks in a Docker container:

```
make test-archlinux
```

## License

[MIT License](LICENSE)
