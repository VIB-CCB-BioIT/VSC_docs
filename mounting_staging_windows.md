Access WSL
Install sshfs if not done yet: `sudo apt update && sudo apt install sshfs -y`
In `cd $HOME`, create a new folder - it will store mounted files: `mkdir ~/remote_data`
Uncomment #user_allow_other in /etc/fuse.conf, and save (important to see the files to be loaded from IGV):
`sudo nano /etc/fuse.conf`
Connect/mount:
`sshfs -o allow_other,reconnect login:/staging/leuven/stg_00096 ~/remote_data -v`
Scan QR code - mounting done.
Exit and Re-enter WSL. Check the folder stores the files. `ls ~/remote_data`.
if you want to change the directory of the server, first unmount and then re-mount with the previous command:
```
fusermount -u ~/remote_data
sshfs -o allow_other,reconnect login:/scratch/leuven/ ~/remote_data -v
```
Get and Copy the entire path: `wslpath -w ~/remote_data`
IGV > load from file.. > paste the path.
 Select Bam file.
