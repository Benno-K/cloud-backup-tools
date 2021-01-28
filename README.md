# raspi-backup-tools
## Abstract
The scripts I use to backup my raspi locally and to webdav cloud storage where it is encrypted using goscriptfs.

## Syntax
```
Usage: cbackup [options]
       -B         don't rsync - useful only for checking mounts
                  and dismounts
       -d         rsync dry-run - don't actually transfer data
       -h         this help
       -m         mount only
       -u         umount only
       -U         don't umount - useful if you want to check
                  your files after rsyncing
       -v         increase verbosity by 1 (can be specified 
                  multiple times).
		  Levels:
		  1 Provide messages of what is going on. 
		  2 Display important commands as they are 
		    executed (using set -x before and set +x 
		    after command execution) - includes all lowerr
		    levels
		  3 Reveal the gocryptfs master-key - includes
		    all lower levels
```
