# Hadoop On Vagrant
This repo contains a collection of vagrant boxes which have come in handy while developing for Hadoop. Each box has its own README with information about that box, and each has its own folder below this directory. Some of the goals of these boxes include:
* Setting up a multi-node Hadoop cluster using VMs
* Setting up an Active Directory or Kerberos node to authenticate against
* Setting up a Linux node capable of compiling Hadoop components

## Prerequisites
* Vagrant (Tested on versions 2.2.X)
* VirtualBox
* vagrant-disksize plugin
* vagrant-vbguest plugin

## Configuration
The boxes all assume that there is a file at common/config.yaml which contains any configuration that may be modified. This file should be based off of the common/config.yaml.template file which is in the repo. The config.yaml file itself is excluded from the repo, and should never be checked in. The following fields are expected to be in the configuration file:
* **git.name:** Your name, which will show up on any git checkins from any of the boxes.
* **git.email:** Your email address, which will be placed on any git checkins from any of the boxes. This may need to be an anonymous email address, if your GitHub account is set up to use one.
* **kerberos.enabled:** If set to true, then the other settings under kerberos will be used to connect the box to a MIT KDC. This is independent of whether the box is connected to Active Directory (meaning that as long as both systems use separate domains, they can both be set up). This value is case-insensitive, and is expected to be "true" or "false".
* **active_directory.enabled:** If set to true, then the other settings under active_directory will be used to connect the box to an AD realm. This is independent of whether the box is connected to an MIT KDC (meaning that as long as both systems use separate domains, they can both be set up). This value is case-insensitive, and is expected to be "true" or "false".
## FAQs
**Q: I cannot run the vagrant boxes due to an error about not having guest additions in the base image**
A: Some of the vagrant images are based on the centos/7 vagrant box, which does not have the guest additions included. Most of the boxes in this collection require at least being able to share a folder between host and guest, so these additions are critical for things to work properly. You should see an error similar to the following if this is your issue:
```
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=1000,gid=1000 vagrant_shared /vagrant_shared

The error output from the command was:

mount: unknown filesystem type 'vboxsf'
```

If this is the issue, run the following command, to install the vagrant-vbguest plugin.
```
vagrant plugin install vagrant-vbguest
```

**Q: I cannot run some vagrant boxes due to an error about disksize**

A: Some of the vagrant images in this collection make use of the vagrant-disksize plugin. If this plugin is not installed, you will see an error such as the following when you try to run *vagrant up*
```
There are errors in the configuration of this machine. Please fix
the following errors and try again:

Vagrant:
* Unknown configuration section 'disksize'.
```

If you see this error, install the vagrant-disksize plugin using the following command:
```
vagrant plugin install vagrant-disksize
```

See https://stackoverflow.com/questions/50063443/vagrant-unknown-configuration-section-disksize for more information.

**Q: Running these boxes gives me an error about raw mode being unavailable**
A: If you are running on Windows, and see errors similar to the following, you need to uninstall Hyper-V:
```
There was an error while executing `VBoxManage`, a CLI used by Vagrant
for controlling VirtualBox. The command and stderr is shown below.

Command: ["startvm", "d2994180-5d66-400d-8ce2-aba0899acf29", "--type", "headless"]

Stderr: VBoxManage.exe: error: Raw-mode is unavailable courtesy of Hyper-V. (VERR_SUPDRV_NO_RAW_MODE_HYPER_V_ROOT)
VBoxManage.exe: error: Details: code E_FAIL (0x80004005), component ConsoleWrap, interface IConsole
```

In this case, turn off Hyper-V in the windows features window. See here for more information: https://discuss.erpnext.com/t/virtualbox-wont-run-raw-mode-unavailable-courtesy-of-hyper-v/34541/10
