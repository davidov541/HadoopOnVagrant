# HadoopOnVagrant
Collection of vagrant boxes which makes setting up a mini-cluster simple

## FAQs
**Q: I cannot run some vagrant boxes due to an error about disksize:**

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
