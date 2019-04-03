rm Shared/*.pub
vagrant up
vagrant ssh -c "sudo /vagrant_shared/distributeKeys.sh; sudo /vagrant_shared/setupSSSD.sh; id -Gn mcginnda" dat1
vagrant ssh -c "sudo /vagrant_shared/distributeKeys.sh; sudo /vagrant_shared/setupSSSD.sh; id -Gn mcginnda" dat2
vagrant ssh -c "sudo /vagrant_shared/distributeKeys.sh; sudo /vagrant_shared/setupSSSD.sh; id -Gn mcginnda; sudo cat /root/.ssh/id_dsa; ifconfig" mst1