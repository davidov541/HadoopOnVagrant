# JupyterHub Box
This box is based on CentOS 7, and installs everything that will be necessary to run a basic instance of JupyterHub on a VM. The instance will be secured based on the local users, which is initially just set to vagrant and root, both of which have unknown passwords. Thus, you need to create your own users before using the JupyterHub instance.

In order to initialize the box, run either ./startBox.ps1 or ./startBox.sh based on the host OS. This will start the box, and also get the JupyterHub process running appropriately.

This box also is set up to be able to kinit against the AD or KDC boxes, if they are up and running. SSSD has not been configured for this box at this point.
