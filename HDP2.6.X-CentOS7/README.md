# HDP 2.6.X Cluster Built on CentOS7
## Description
This vagrant file sets up a 3 node cluster running CentOS7 and HDP 2.6.X. As currently configured, the following nodes are created:
1. mst1.test.hadoop.com - Master node with 8 GB of RAM and 1 core
2. dat1.test.hadoop.com - Data node with 4 GB of RAM and 1 core
3. dat2.test.hadoop.com - Data node with 4 GB of RAM and 1 core

These values are flexible, and can be modified as required. More data nodes or master nodes can be created, as your system will allow.

This file also runs a FreeIPA server on the master node, and connects all three nodes to use the users and groups on that server, through SSSD. The server is currently empty after creation, but can be modified through command line, or the UI which runs on 8443 as an HTTPS server.

## Usage Notes
Make sure to use the createCluster script in order to create the box. This runs the vagrant boxes, but also runs some scripts afterwards to ensure that passwordless SSH is set up, and then print out some useful information for later.

Once this file is run, both FreeIPA and Ambari will be running on the master node, but HDP will still not be installed. 

The first step necessary is to get the IP address from the ifconfig output that ends the output. On my machine, this is always the 192.168.*.* IP address, but may differ on different systems. If in doubt, try different ones until you find the IP address accessible from your host. From now on, the IP address of the master node will be denoted by $IP.

The installation portion must be done manually, by going to http://$IP:8888. Note this is different than the default port for Ambari, since it conflicted with the default port for FreeIPA.

Most of the directions located [here](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-installation/content/log_in_to_apache_ambari.html).

The private SSH key for the master root user is printed out at the end of the creation of the cluster. On some terminals, I've seen issues with SSH not working when registering hosts. In these instances, pasting the key to a text editor like Sublime before copying and pasting into the window helped fix whatever unprintable characters were causing issues.

We have set up a PostgreSQL database for use with Ambari, so for the following services, use the existing PostgreSQL option, point it to the master node, and use the indicated credentials.
* Hive - Password: hivepw
* Oozie - Password: ooziepw
