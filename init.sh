#!/bin/bash

REPO=${REPO:-https://github.com/rothgar/ansible-workstation.git}
CLONE_DIR=${CLONE_DIR:-/home/"${SUDO_USER}"/src/ansible-workstation}

# install initial packages
yum install -y ansible git zsh

# clone this repo
mkdir -p "${CLONE_DIR}"
git clone --recursive "${REPO}" "${CLONE_DIR}"
chown -R ${SUDO_USER}.${SUDO_USER} ${CLONE_DIR}

ANSIBLE_NOCOWS=1 ansible-playbook -u ${SUDO_USER} -i "${CLONE_DIR}"/hosts.template "${CLONE_DIR}"/main.yml
