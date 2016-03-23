@echo off

ssh pi@5428-Liquid.local "rm /home/pi/Test || true;" 2>nul
sftp -oBatchMode=no -b sftpbatchfile pi@5428-Liquid.local > nul 2>&1
ssh pi@5428-Liquid.local "sudo chmod a+x /home/pi/Test"
echo Deployed