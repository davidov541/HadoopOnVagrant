# JupyterHub Box
This box is based on CentOS 7, and installs everything that will be necessary to run a basic instance of JupyterHub on a VM. There is also an Nginx instance running on the box in order to redirect HTTP requests to the box to the appropriate port in JupyterHub. This facilitates more complex use cases that may be necessary, such as HTTPS or having multiple web services running on the box.

The base image includes the following kernels:
- Python 3 Kernel with Spark libraries included
- Spark Scala kernel running locally using Apache Toree
- Spark SQL kernel running locally using Apache Toree

Spark is currently configured to use Spark 2.1.3, but can be configured to use any version from 2.X+.

## Usage

In order to initialize the box, run *vagrant up*. This will start the box, and also get the JupyterHub process running appropriately. The JupyterHub process is configured as a Linux daemon, so it will run automatically when restarted.

At the end of the output, there will be a line similar to the following. Use this link in order to open up JupyterHub in your local browser.

*Jupyter is now running at http://192.168.1.115/*

The instance initially has a single user on it with the following credentials. This user can be used to log into JupyterHub. More can be added using the useradd feature as root on the box itself.

**Username:** user

**Password:** userpw
