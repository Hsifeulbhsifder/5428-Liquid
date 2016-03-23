@echo off

ssh-keygen -t rsa
ssh pi@5428-Liquid.local "sudo mkdir ~/.ssh;sudo chmod 777 ~/.ssh"
scp id_rsa.pub pi@5428-Liquid.local:~/.ssh/authorized-keys
PAUSE