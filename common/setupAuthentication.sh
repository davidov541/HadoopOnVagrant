#!/bin/bash

kdcEnable=$(cat /vagrant_common/config.yaml | shyaml get-value kerberos.enabled | tr '[:upper:]' '[:lower:]')
adEnable=$(cat /vagrant_common/config.yaml | shyaml get-value active_directory.enabled | tr '[:upper:]' '[:lower:]')

if [[ "$kdcEnable" == "true" || "$adEnable" == "true" ]]; then
    yum -y install krb5-libs krb5-workstation krb5-devel openldap*
    \\cp /vagrant_common/ldap.conf /etc/openldap/ldap.conf
    \\cp /vagrant_common/krb5.conf /etc/krb5.conf
fi