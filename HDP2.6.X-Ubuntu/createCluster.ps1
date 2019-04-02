rm Shared/*.pub
vagrant up
vagrant ssh -c "sudo /vagrant_shared/distributeKeys.sh" dat1
vagrant ssh -c "sudo /vagrant_shared/distributeKeys.sh" dat2
vagrant ssh -c "sudo /vagrant_shared/distributeKeys.sh" mst1