desktop-admin
==================

This repository contains Ansible playbooks and configurations used to provision my desktop machines.

Installation
---------------

This repository should be cloned to your `~/admin`:

```sh
git clone git@github.com:akirak/desktop-admin.git ~/admin
```

Usage
------

### Initial run

```sh
./bootstrap.sh
```

After setting up ~/deft directory on Resilio Sync, run:

```sh
npm run deft
```

### After updating your configuration file and/or playbook

```sh
npm run up
```

Directory structure
------------------------

- ~/admin
  - files/
    - config/: configuration files (used by mackup)
