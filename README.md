backup-manager Cookbook
================
[![Build Status](https://travis-ci.org/indigo423/backup-manager.svg)](https://travis-ci.org/indigo423/backup-manager)

[travis]: https://travis-ci.org/indigo423/backup-opennms

This cookbook help you to setup backup-manager.

You can setup the folder you want to backup. It allows to modify and configure the backup-manager configuration through Chef.

The cookbook can be tested using `kitchen` and `Vagrant` is preconfigured with a minimal Ubuntu Server 14.04 LTS and Centos 6.5 image. See:
- `kitchen list`
- `kitchen converge [INSTANCE|REGEXP|all]`

Requirements
------------
- `Ubuntu` >= 8.04
- `Debian` >= 4.0
- `VirtualBox` and `Chef DK` if you want to contribute and/or test the cookbook.

Dependencies
------------
The OpenNMS cookbook depends on the cookbook `java` and `postgresql`. The  cookbook dependencies are handled by `Berkshelf`.  The  Java and Postgres cookbooks are preconfigured to met the requirements for running OpenNMS. The following default attributes are set:

Attributes
----------
The default configuration installs `backup-manager` from the distribution provided package management system `yum` or `apt`. The following attributes can be modified to configure `backup-manager` through Chef.

#### Repository - everything about where archives are
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['repository_root']</tt></td>
    <td>String</td>
    <td>Where to store the archives</td>
    <td><tt>/var/archives</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tmp_dir']</tt></td>
    <td>String</td>
    <td>Where to place temporary files</td>
    <td><tt>/tmp</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['repository_secure']</tt></td>
    <td>String</td>
    <td>For security reasons, the archive repository and the generated archives will be readable/writable by a given user/group. This is recommended to set this to true.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['user']</tt></td>
    <td>String</td>
    <td>The repository will be readable/writable only by a specific <tt>user</tt> if <tt>repository_secure</tt> is set to true.</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['group']</tt></td>
    <td>String</td>
    <td>The repository will be readable/writable only by a specific <tt>group</tt> if <tt>repository_secure</tt> is set to true.</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['repository_chmod']</tt></td>
    <td>String</td>
    <td>You can also choose the permission to set the repository, pay attention to what you do there!</td>
    <td><tt>770</tt></td>
  </tr>
</table>

#### Archives - let's focus on the precious tarballs...
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_chmod']</tt></td>
    <td>String</td>
    <td>Each archive generated will be chmoded for security reasons (<tt>repository_secure</tt> should be enabled for this).</td>
    <td><tt>660</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_ttl']</tt></td>
    <td>Integer</td>
    <td>Number of days we have to keep an archive (Time To Live)</td>
    <td><tt>7</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['repository_recursivepurge']</tt></td>
    <td>Boolean</td>
    <td>Number of days we have to keep an archive (Time To Live)</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_purgedups']</tt></td>
    <td>Boolean</td>
    <td>Do you want to replace duplicates by symlinks?</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_prefix']</tt></td>
    <td>String</td>
    <td>Prefix of every archive on that box</td>
    <td><tt>$HOSTNAME</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_strictpurge']</tt></td>
    <td>Boolean</td>
    <td>Should we purge only archives built with <tt>archive_prefix</tt></td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_nice_level']</tt></td>
    <td>Integer</td>
    <td>Choose a nice level from <tt>-20</tt> (most favorable scheduling) to <tt>19</tt> (least favorable).</td>
    <td><tt>10</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['archive_method']</tt></td>
    <td>String</td>
    <td>The backup method to use. Available methods are: <tt>tarball</tt>, <tt>tarball-incremental</tt>, <tt>mysql</tt>, <tt>svn</tt>, <tt>pipe</tt>, <tt>none</tt></td>
    <td><tt>tarball</tt></td>
  </tr>
</table>

#### Encryption - because you cannot trust the place your archives are
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['encryption_method']</tt></td>
    <td>String</td>
    <td>Uncomment the following line if you want to enable encryption available method: gpg</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['encryption_recipient']</tt></td>
    <td>String</td>
    <td>The encryption will be made using a GPG ID</td>
    <td></td>
  </tr>
</table>

#### Section "TARBALL"
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_nameformat']</tt></td>
    <td>String</td>
    <td>Archive filename format. <tt>long</tt> (host-full-path-to-folder.tar.gz), <tt>short</tt> (parentfolder.tar.gz)</td>
    <td><tt>long</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_filetype']</tt></td>
    <td>String</td>
    <td>Type of archives. Available types are: <tt>tar</tt>, <tt>tar.gz</tt>, <tt>tar.bz2</tt>, <tt>tar.lz</tt>, <tt>dar</tt>, <tt>zip</tt>.</td>
    <td><tt>tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_over_ssh']</tt></td>
    <td>Boolean</td>
    <td>You can choose to build archives remotely over SSH. You will then need to fill the <tt>upload_ssh</tt> variables (<tt>upload_ssh_hosts</tt>, <tt>upload_ssh_user</tt>, <tt>upload_ssh_key</tt>). If this boolean is set to true, archive will be saved locally (in <tt>repository_root</tt> but will be built by the remote host). Thus, <tt>tarball_directories</tt> will be used to backup remote directories. Those archive will be prefixed with the remote host name.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_dumpsymlinks']</tt></td>
    <td>Boolean</td>
    <td>Do you want to dereference the files pointed by symlinks? <tt>true</tt> can lead to huge archives, be careful.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_directories']</tt></td>
    <td>Array</td>
    <td>Paths without spaces in their name. Atttention: It is not possible to put in paths with apsces!</td>
    <td><tt>/etc /home</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_blacklist']</tt></td>
    <td>String</td>
    <td>Files to exclude when generating tarballs, you can put absolute or relative paths, Bash wildcards are possible.</td>
    <td><tt>/var/archives</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarball_slicesize']</tt></td>
    <td>String</td>
    <td>With the "dar" filetype, you can choose a maximum slice limit.</td>
    <td><tt>1000M</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarballinc_masterdatetype']</tt></td>
    <td>String</td>
    <td>Which frequency to use for the master tarball? possible values: <tt>weekly</tt>, <tt>monthly</tt></td>
    <td><tt>weekly</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['tarballinc_masterdatevalue']</tt></td>
    <td>Integer</td>
    <td>Number of the day, in the <tt>tarballinc_masterdatetype</tt> frequency when master tarballs should be made</td>
    <td><tt>1</tt></td>
  </tr>
</table>

#### Section "MYSQL"
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_databases']</tt></td>
    <td>String</td>
    <td>This method is dedicated to MySQL databases. You should not use the tarball method for backing up database directories or you may have corrupted archives. Enter here the list of databases to backup. Wildcard: <tt>__ALL__</tt> (will dump all the databases in one archive). If you want *all* databases in a seperate archive use <tt>LISTDB</tt> instead.</td>
    <td><tt>__ALL__</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_safedumps']</tt></td>
    <td>Boolean</td>
    <td>The best way to produce MySQL dump is done by using the <tt>--opt</tt> switch of <tt>mysqldump</tt>. This make the dump directly usable with mysql (add the drop table statements), lock the tables during the dump and other things. This is recommended for full-clean-safe backups, but needs a privileged user (for the lock permissions).</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_adminlogin']</tt></td>
    <td>String</td>
    <td>The user who is allowed to read every databases filled in <tt>mysql_databases</tt></td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_adminpass']</tt></td>
    <td>String</td>
    <td>Password for given <tt>mysql_adminlogin</tt></td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_host']</tt></td>
    <td>String</td>
    <td>Host where the database is</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_port']</tt></td>
    <td>Integer</td>
    <td>Port where MySQL is listen on the host</td>
    <td><tt>3306</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['mysql_filetype']</tt></td>
    <td>String</td>
    <td>Which compression format to use? (<tt>gzip</tt> or <tt>bzip2</tt>)</td>
    <td><tt>bzip2</tt></td>
  </tr>
</table>

#### Section "SVN"
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['svn_repositories']</tt></td>
    <td>String</td>
    <td>Absolute paths to the svn repositories to archive</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['svn_compresswith']</tt></td>
    <td>String</td>
    <td>Which compression format to use? (<tt>gzip</tt> or <tt>bzip2</tt>)</td>
    <td><tt>bzip2</tt></td>
  </tr>
</table>

#### Section "UPLOAD"
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_method']</tt></td>
    <td>String</td>
    <td>Which method to use for uploading archives, you can put multiple methods here. Available methods: <tt>scp</tt>, <tt>ssh-gpg</tt>, <tt>ftp</tt>, <tt>rsync</tt>, <tt>s3</tt>, <tt>none</tt>. If you don't want to use any upload method (you don't want to upload files to remote hosts) then choose <tt>none</tt></td>
    <td><tt>none</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_host']</tt></td>
    <td>String</td>
    <td>Which compression format to use? (<tt>gzip</tt> or <tt>bzip2</tt>)</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_destination']</tt></td>
    <td>String</td>
    <td>Where to put archives on the remote hosts (global)</td>
    <td></td>
  </tr>
</table>

#### SSH method
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ssh_key']</tt></td>
    <td>String</td>
    <td>The private key to use for opening the connection</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ssh_hosts']</tt></td>
    <td>String</td>
    <td>Specific ssh hosts</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ssh_port']</tt></td>
    <td>Integer</td>
    <td>Specific ssh hosts</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ssh_destination']</tt></td>
    <td>String</td>
    <td>Port to use for SSH connections (leave blank for default <tt>22</tt>)</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ssh_purge']</tt></td>
    <td>String</td>
    <td>Destination for ssh uploads (overrides <tt>upload_destination</tt>)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ssh_ttl']</tt></td>
    <td>Integer</td>
    <td>If you set <tt>upload_ssh_purge</tt>, you can specify a time to live for archives uploaded with SSH. This can let you use different ttl's locally and remotely By default, <tt>archive_ttl</tt> will be used.</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_sshgpg_recipient']</tt></td>
    <td>Integer</td>
    <td>The gpg public key used for encryption, this can be a short or long key id, or a descriptive name. See <tt>gpg</tt> man page for all possibilities how to specify a key.</td>
    <td></td>
  </tr>
</table>

#### FTP method
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_secure']</tt></td>
    <td>Boolean</td>
    <td>Use FTP secured transfers (FTP over TLS) User, password and data will be uploaded encrypted with SSL. Passive mode will be automaticaly activated</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_passive']</tt></td>
    <td>Boolean</td>
    <td>Do you want to use FTP passive mode? This is mandatory for NATed/firewalled environments</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_user']</tt></td>
    <td>String</td>
    <td>User to use for the FTP connections/transfers</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_password']</tt></td>
    <td>String</td>
    <td>FTP user's password</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_host']</tt></td>
    <td>String</td>
    <td>FTP specific remote hosts</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_purge']</tt></td>
    <td>Boolean</td>
    <td>Purge archives on remote hosts before uploading?</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_ttl']</tt></td>
    <td>Integer</td>
    <td>You can specify a time to live for archives uploaded with FTP. This can let you use different ttl's locally and remotely. By default, <tt>archive_ttl</tt> will be used.</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_ftp_destination']</tt></td>
    <td>String</td>
    <td>Destination for FTP uploads (overrides <tt>upload_destination</tt>)</td>
    <td></td>
  </tr>
</table>

#### S3 method
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_s3_destination']</tt></td>
    <td>String</td>
    <td>The bucket to upload to. This bucket must be dedicated to backup-manager</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_s3_access_key']</tt></td>
    <td>String</td>
    <td>The S3 access key provided to you</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_s3_secret_key']</tt></td>
    <td>String</td>
    <td>The S3 secret key provided to you</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_s3_purge']</tt></td>
    <td>String</td>
    <td>Purge archives on remote hosts before uploading?</td>
    <td></td>
  </tr>
</table>

#### RSYNC method
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_rsync_directories']</tt></td>
    <td>String</td>
    <td>Which directories should be backuped with </td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_rsync_destination']</tt></td>
    <td>String</td>
    <td>Destination for rsync uploads (overrides BM_UPLOAD_DESTINATION)</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_rsync_hosts']</tt></td>
    <td>String</td>
    <td>The list of remote hosts, if you want to enable the upload system, just put some remote hosts here (fqdn or IPs). Leave it empty if you want to use the hosts that are defined in <tt>upload_host</tt></td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_rsync_dumpsymlinks']</tt></td>
    <td>String</td>
    <td>Do you want to dereference the files pointed by symlinks? Enter <tt>true</tt> or <tt>false</tt> (<tt>true</tt> can lead to huge archives, be careful).</td>
    <td><tt>false</tt></td>
  </tr>
</table>

#### BURNING
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_method']</tt></td>
    <td>String</td>
    <td>Method of burning archives from the list: <tt>DVD</tt>, <tt>DVD-RW</tt>, <tt>CDRW</tt>, <tt>CDR</tt>, <tt>none</tt>. Note that if <tt>backup-manager</tt> is run from interactive prompt you will be asked to insert disc(s) when needed</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_chkmd5']</tt></td>
    <td>String</td>
    <td>When the CD is burnt, it is possible to check every file's MD5 checksum to see if the CD is not corrupted.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_device']</tt></td>
    <td>String</td>
    <td>The device to use for mounting the cdrom</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_devforced']</tt></td>
    <td>String</td>
    <td>You can force cdrecord to use a specific device. Fill in the full path to the device to use or even e.g. <tt>burning_devforced="/dev/cdrom"</tt>. If none specified, the default <tt>cdrecord</tt> device will be used.</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_iso_flags']</tt></td>
    <td>String</td>
    <td>By default <tt>backup-manager</tt> will make Joliet media (using the <tt>mkisofs</tt> switches <tt>"-R -J"</tt>). You can change these if you want to use non-Joliet disc images. Change this only if you know what you're doing. Refer to <tt>mkisofs(8)</tt> for details.</td>
    <td><tt>-R -J</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_maxsize']</tt></td>
    <td>Integer</td>
    <td>Enter here the max size of your media (usual sizes are <tt>4200</tt> for DVD media and <tt>700</tt> or <tt>800</tt> for CDR media)</td>
    <td></td>
  </tr>
</table>

#### CRON
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['cron_minute']</tt></td>
    <td>String</td>
    <td>Use the con syntax to set the minutes, default : </td>
    <td>*</td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['cron_hour']</tt></td>
    <td>String</td>
    <td>Use the con syntax to set the minutes, default : </td>
    <td>*</td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['cron_day']</tt></td>
    <td>String</td>
    <td>Use the con syntax to set the minutes, default : </td>
    <td>*</td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['cron_month']</tt></td>
    <td>String</td>
    <td>Use the con syntax to set the minutes, default : </td>
    <td>*</td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['cron_week']</tt></td>
    <td>String</td>
    <td>Use the con syntax to set the minutes, default : </td>
    <td>*</td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['upload_burning_maxsize']</tt></td>
    <td>Integer</td>
    <td>Use the con syntax to set the minutes, default : </td>
    <td>*</td>
  </tr>
</table>

#### Advanced settings, use this with care
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backup_manager']['logger']</tt></td>
    <td>Boolean</td>
    <td>Every output made can be sent to syslog set this to <tt>true</tt> or <tt>false</tt></td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['logger_level']</tt></td>
    <td>String</td>
    <td>Which level of messages do you want to log to syslog? Possible values are: <tt>debug</tt>, <tt>info</tt>, <tt>warning</tt>, <tt>error</tt></td>
    <td><tt>warning</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['logger_facility']</tt></td>
    <td>String</td>
    <td>You can choose which facility to use.</td>
    <td><tt>user</tt></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['pre_backup_command']</tt></td>
    <td>String</td>
    <td>Enter here some shell script. It will be executed before the first action of <tt>backup-manager</tt>.</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['backup_manager']['post_backup_command']</tt></td>
    <td>String</td>
    <td>Enter here some shell script. It will be executed after the last action of <tt>backup-manager</tt>.</td>
    <td></td>
  </tr>
</table>

Usage
-----
#### backup-manager
This cookbook will install `backup-manager` with all default settings. You have just include `backup-manager` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[backup-manager]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:
- Nacer Laradji https://github.com/laradji
- Ronny Tromer https://github.com/indigo423
