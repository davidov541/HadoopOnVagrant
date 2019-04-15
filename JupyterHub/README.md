# JupyterHub Box
This box is based on CentOS 7, and installs everything that will be necessary to run a basic instance of JupyterHub on a VM.

This box also is set up to be able to kinit against the AD or KDC boxes, if they are up and running. SSSD has not been configured for this box at this point.

## Usage

In order to initialize the box, run either ./startBox.ps1 or ./startBox.sh based on the host OS. This will start the box, and also get the JupyterHub process running appropriately.

The instance initially has a single user on it with the following credentials. This user can be used to log into JupyterHub.

**Username:** user

**Password:** userpw
