#!/usr/bin/env bash
# -*- coding: utf-8 -*-

#
# dotconfig-util.sh - bash utilities for managing dotconfig
#

function reapply_dotconfig () {
    args=${*}

    if [ ! -d "${HOME}/.dotconfig" ] ; then
        echo " [!] dotconfig playbook does not exist at ~/.dotconfig"
        return 1
    fi

    pushd ${HOME}/.dotconfig 2>&1 1>/dev/null
    ansible-playbook -i inventory/hosts.txt ${args} site.yml
    popd 2>&1 1>/dev/null
}

function modify_dotconfig_role () {
    role=$1;    shift
    args=${*}

    if [ ! -d "${HOME}/.dotconfig" ] ; then
        echo " [!] dotconfig playbook does not exist at ~/.dotconfig"
        return 1
    fi

    vim ${HOME}/.dotconfig/roles/internal/${role}
}
