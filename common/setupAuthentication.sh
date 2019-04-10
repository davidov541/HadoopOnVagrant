#!/bin/bash
kdcEnable=$(cat /vagrant_common/config.yaml | shyaml get-value kerberos.enabled | tr '[:upper:]' '[:lower:]')
adEnable=$(cat /vagrant_common/config.yaml | shyaml get-value active_directory.enabled | tr '[:upper:]' '[:lower:]')

if [[ "$kdcEnable" == "true" || "$adEnable" == "true" ]]; then
    yum -y install krb5-libs krb5-workstation krb5-devel openldap*
    cp -f /vagrant_common/ldap.conf /etc/openldap/ldap.conf
    cp -f /vagrant_common/krb5.conf /etc/krb5.conf
    if [[ "$adEnable" == "true" ]]; then
        adRealm=$(cat /vagrant_common/config.yaml | shyaml get-value active_directory.realm | tr '[:upper:]' '[:lower:]')
        adServer=$(cat /vagrant_common/config.yaml | shyaml get-value active_directory.server | tr '[:upper:]' '[:lower:]')
        cp -f /vagrant_common/realm.template ~/ad.realm
        sed -i "s/\${domain}/$adRealm/g" ~/ad.realm
        sed -i "s/\${[a-zA-Z]*erver}/$adServer/g" ~/ad.realm
        cat ~/ad.realm >> /etc/krb5.conf
        sed -i "s/\${domain}/$adRealm/g" /etc/krb5.conf
    fi
    if [[ "$kdcEnable" == "true" ]]; then
        kdcDomain=$(cat /vagrant_common/config.yaml | shyaml get-value kerberos.domain | tr '[:upper:]' '[:lower:]')
        kdcServer=$(cat /vagrant_common/config.yaml | shyaml get-value kerberos.server | tr '[:upper:]' '[:lower:]')
        cp -f /vagrant_common/realm.template ~/kdc.realm
        sed -i "s/\${domain}/$kdcServer/g" ~/kdc.realm
        sed -i "s/\${[a-zA-Z]*erver}/$kdcServer/g" ~/kdc.realm
        cat ~/kdc.realm >> /etc/krb5.conf
        sed -i "s/\${domain}/$kdcDomain/g" /etc/krb5.conf
    fi
fi
