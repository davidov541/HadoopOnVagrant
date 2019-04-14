# Hive Sandbox Box
This box is based on CentOS 7, and sets up an instance of Apache Hive against which basic functionality testing can be performed. This box assumes that a file called hive.tar.gz is placed in the Shared folder, which is the tarball of the Hive binaries to use.

This box also is set up to be able to kinit against the AD or KDC boxes, if they are up and running. SSSD has not been configured for this box at this point.
