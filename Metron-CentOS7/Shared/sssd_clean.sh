#!/bin/bash
#-------------------------
#Reset script
#-------------------------
#stop service:
service nscd stop; service sssd stop
 
#clean up Cache
rm -f /var/lib/sss/mc/*
rm -f /var/lib/sss/db/*
 
service nscd start; service sssd start
