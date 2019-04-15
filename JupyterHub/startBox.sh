#!/bin/bash
vagrant up
vagrant ssh -c "nohup KRB5_CONFIG=/etc/krb5.conf nohup jupyterhub -f jupyterhub_config.py &>> /var/log/jupyterhub.log & sleep 1"
