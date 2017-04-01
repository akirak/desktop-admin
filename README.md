user-admin
==================

This repository contains Ansible playbooks and configurations used to provision my desktop machines.

Note that this repository probably doesn't work on machines of other people. It is published for backup and reference.

Installation
---------------

This repository should be cloned to your `~/admin`:

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
