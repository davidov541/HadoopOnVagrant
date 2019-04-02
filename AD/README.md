# Test AD FS 2
Test infrastructure for AD FS 2.

The following boxes could be created:

1. `dc` : The Active Directory Domain controller
2. `adfs2` : The Active Directory Federation Service
3. `web`: The Web Server running IIS
4. `ps`: A Windows Print Server on Windows Server 2012 R2
5. `ts`: A Windows Terminal Server

## Installation

This `Vagrantfile` uses the [`vagrant-reload`](https://github.com/aidanns/vagrant-reload) plugin to reboot the Windows VM's during provisioning. If you don't have this plugin installed, do it now with

```bash
vagrant plugin install vagrant-reload
```

To build the boxes, use `vagrant up` with the box name.
Each box will be reboot twice until all features are up and running.

### Create Domain Controller
First create the AD domain controller

```bash
vagrant up dc
```

After that the domain `windomain.local` is up and running at IP address `192.168.38.2`.
Some users will be created from the `users.csv` file.
A special service user will be created for JBoss7 integration and its keytab file for SSO.

### Create AD FS2 Server
This guest will join the domain and install the ADFS2.

```bash
vagrant up adfs2
```

I don't know if the ADFS2 is set up correctly. I just managed the domain join.

### Create Web Server
This guest will join the domain and set up an IIS Web Server on host `web`.

```bash
vagrant up web
```

After installation, you have an IIS 7 Web Server, but also an [iisnode](https://github.com/tjanczuk/iisnode) with Node.js up and running.

* [http://web.windomain.local/](http://localhost:8080/)
* [http://web.windomain.local/node](http://localhost:8080/node)


The guest will reboot twice until all features are up and running.

## Normal Use
After setting up all boxes, you simply can start and stop the boxes, but the
Domain Controller should be started first and stopped last.

```bash
vagrant up dc
vagrant up web
vagrant halt web
vagrant halt dc
```
