# raspi-backup-tools
## Abstract
The scripts I want to use to backup my raspi locally and to webdav cloud storage where it is encrypted using goscriptfs.

**WARNING:**
I haven"t used or tested them for years now. Try at your own risk.

### Update
The cbackup has been enhanced
and tested a bit, but due to
the lousy davfs performance
and davfs caching issues I
cannot test rsync. Since that
is the core-feature, cbackup 
is currently quite useless for
me. Maybe it works with other
clouds but with my 
MagentaCloud it is tooooo slow.

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
but do not block like mount
sometimes does.
