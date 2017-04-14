user-admin
==================

This repository contains Ansible playbooks and configurations used to provision my desktop and laptop machines.

Caution: This repository probably doesn't work on machines of other people. It is published for backup and referencing purposes.

Installation
---------------

Clone this repository to `~/admin`:

```sh
git clone git@github.com:akirak/user-admin.git ~/admin
```

Usage
------

### Initial run

```sh
./install.sh
```

### After updating your configuration file and/or playbook

```sh
npm run up
```

Directory structure
------------------------

- ~/admin
  - files/
    - dotfiles/: configuration files (used by mackup)
