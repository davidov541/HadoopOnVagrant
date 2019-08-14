#!/bin/bash
       
\cp /vagrant_shared/dhclient.conf /etc/dhcp/dhclient.conf
service network restart

realm join -v --user=vagrant@TEST.HADOOP.COM --automatic-id-mapping=yes --computer-ou="OU=COMPUTERS,OU=GENERIC,OU=HADOOP,DC=TEST,DC=HADOOP,DC=COM" TEST.HADOOP.COM
authconfig --enablesssd --enablesssdauth --enablelocauthorize  --enablemkhomedir --updateall
\cp /vagrant_shared/nscd.conf /etc/nscd.conf
       
chmod 0666 /var/lib/sss/pipes/pam
chmod 0666 /var/lib/sss/pipes/nss
setfacl --remove-default /var/lib/sss/pipes/
\cp /vagrant_shared/sssd.conf /etc/sssd/sssd.conf
chmod 0600 /etc/sssd/sssd.conf

/vagrant_shared/sssd_clean.sh
