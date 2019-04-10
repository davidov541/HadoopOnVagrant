# Linux Development Box
This box is based on CentOS 7, and installs everything that will be necessary to install, test, and contribute back to the Apache Hadoop and Hive projects, as well as most other Apache projects. 

This box also is set up to be able to kinit against the AD or KDC boxes, if they are up and running. SSSD has not been configured for this box at this point.

## Necessary Changes to Use
There are a few changes that should likely be done to use this vagrant box.
* The krb5.conf and ldap.conf files should be updated accordingly to match your Kerberos environment.
