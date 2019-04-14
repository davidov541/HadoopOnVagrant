vagrant up
vagrant ssh -c "KRB5_CONFIG=/etc/krb5.conf nohup jupyterhub -f jupyterhub_config.py & sleep 1"