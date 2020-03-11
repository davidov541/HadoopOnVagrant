# FreeIPA Development Server Box
This box is based on CentOS 7, and installs a simple version of the [FreeIPA](https://www.freeipa.org/page/Main_Page) server which can be used when testing security functionality in any of the other boxes in this repository.

## What is FreeIPA?
FreeIPA is an OSS system maintained primarily by the Fedora community which aims to be a free and open-source competitor to Active Directory. It uses a multitude of different OSS technologies, and packages them into one service that can be maintained together. These services include:

* MIT KDC
* 389 Directory Server
* SSSD (A service which helps synchronize users between an LDAP or Kerberos server and a local Linux installation)
* NTP
* DogTag Certificate System

## Usage with Other Vagrant Boxes
Vagrant boxes in this repository will all eventually automatically connect with this server if it is running when the vagrant box is brought up. Due to this, this box should be the first box brought up if it is needed for the system. Otherwise, manual work will be necessary in order to connect the two. The exact work needed for this depends on the box, so you'll need to look into the box's Vagrantfile itself.

At this time, that is not the case however. [There is a project](https://github.com/davidov541/HadoopOnVagrant/projects/2) being worked on which will bring this functionality to all boxes. Please check the status of this project to understand where the vagrant box you wish to use with this server stands.

## Usage Notes
This server uses the domain TEST.HADOOP.COM, and by default creates a single admin user with the following credentials:

*Username*: admin

*Password*: kerberosAdmin

To create other users, you should use [the standard FreeIPA commands](https://docs.fedoraproject.org/en-US/Fedora/15/html/FreeIPA_Guide/adding-users.html) on this server, likely something similar to the following:

```ipa user-add jlamb --first=John --last=Lamb --password```
