# raspi-backup-tools
## Abstract
The scripts I want to use to backup my raspi locally (backup) and to webdav cloud storage (cbackup) where it is encrypted using goscriptfs.

**WARNING:**
I haven"t used or tested cbackup for years now. Try at your own risk. For local backups the script "backup" is running 
nightly for about a decade now, and I restored files from it. Restoring single files from it requires that you have enough space to gunzip the dumps to be able to mount them.

### Update
The cbackup has been enhanced
and tested a bit, but due to
the lousy performance I
cannot test rsync. Since that
is the core-feature, cbackup 
is currently quite useless for
me. Maybe it works in other
environments but with my
10 Mbit/s
uplink to the MagentaCloud it is tooooo slow.

## backup
Uses dd to create binary 
compressed image from the filesystems
- /
- /boot

As / on a raspi changes quite
s lot, it should be almost
filled with zeroes (by
creating a file filled with 
zeroes from time to time to 
get good gzip compression. In
my PublicScripts repo the script
zero-out-root-filesystem does
this job. I taught cron to
run it weekly.


## cbackup
Do rsync to cloud via webdav and encrypt using gocryptfs

### Implications
This has quite some implications of which you do not
think in the first place:
1. Make sure you specify the right directory to hold temporary files - as rsync operation creates temporary files. The variable tmpdir in the script which is quite specific for the author's environment can be overwritten by the TMPDIR environment variable or by specifying the -t option followed by your temp dir.
1. Note that rsync's remote temporary directory actually is local as you rsync to a locally mounted davfs2.
1. Make sure to have a suitable sized caching directory for davfs2. The default is /var/cache/davfs2. If your /var is to small to hold the biggest file transferred plus some spare it will not work
1. You can edit the system davfs2 config file, to specify another cache-directory.

### Syntax
```
Usage: cbackup [options]
       -B         don't rsync - useful only for checking mounts
                  and dismounts
       -d         rsync dry-run - don't actually transfer data
       -h         this help
       -m         mount only
       -t <dir>   temporary directory for rsync
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

## vmf
### View mounted filesytems
Show all mounted file systems
like the "mount" command does
but do not block, like mount
sometimes does.

## kpbackup
Backup KeePass to magenta
cloud

## mbxbackup
Backup directories of virtual
mail users - needs root to mount
the cloud storage
