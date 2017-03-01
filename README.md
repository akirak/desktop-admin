# Ansible Playbook Template for Arch Linux

This repository contains a very basic structure for writing an Ansible playbook for Arch Linux. It can be testable on Vagrant.

[bugyt/archlinux](https://atlas.hashicorp.com/bugyt/boxes/archlinux) is used as a box for testing.

## Usage

### Testing on Vagrant

    vagrant up --provision

### Running on your machine

    ansible-playbook -c local -i localhost playbook.yml
