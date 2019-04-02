#!/bin/bash
       
\cp /vagrant_shared/dhclient.conf /etc/dhcp/dhclient.conf
service network restart

realm join --user=binduser@AD.DAVIDMCGINNIS.NET --automatic-id-mapping=yes --computer-ou="OU=COMPUTERS,OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET" AD.DAVIDMCGINNIS.NET
authconfig --enablesssd --enablesssdauth --enablelocauthorize  --enablemkhomedir --updateall
\cp /vagrant_shared/nscd.conf /etc/nscd.conf
       
chmod 0666 /var/lib/sss/pipes/pam
chmod 0666 /var/lib/sss/pipes/nss
setfacl --remove-default /var/lib/sss/pipes/
\cp /vagrant_shared/sssd.conf /etc/sssd/sssd.conf

/vagrant_shared/sssd_clean.sh
