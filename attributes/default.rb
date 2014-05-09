#
# Cookbook Name:: backup-manager
# Attributes:: backup_manager

default['backup_manager']['repository_root'] = '/var/archives'
default['backup_manager']['tmp_dir'] = '/tmp'
default['backup_manager']['repository_secure'] = 'true'
default['backup_manager']['user'] = 'root'
default['backup_manager']['group'] = 'root'
default['backup_manager']['repository_chmod'] = '770'

default['backup_manager']['archive_chmod'] = '660'
default['backup_manager']['archive_ttl'] = '7'
default['backup_manager']['repository_recursivepurge'] = 'false'
default['backup_manager']['archive_purgedups'] = 'true'
default['backup_manager']['archive_prefix'] = '$HOSTNAME'
default['backup_manager']['archive_strictpurge'] = 'true'
default['backup_manager']['archive_nice_level'] = '10'
default['backup_manager']['archive_method'] = 'tarball'

default['backup_manager']['encryption_method'] = ''
default['backup_manager']['encryption_recipient'] = ''

default['backup_manager']['tarball_nameformat'] = 'long'
default['backup_manager']['tarball_filetype'] = 'tar.gz'
default['backup_manager']['tarball_over_ssh'] = 'false'
default['backup_manager']['tarball_dumpsymlinks'] = 'false'
default['backup_manager']['local_folder'] = [ "/etc","/home" ]
default['backup_manager']['tarball_blacklist'] = '/var/archives'
default['backup_manager']['tarball_slicesize'] = '1000M'
default['backup_manager']['tarball_extra_options'] = ''
default['backup_manager']['tarballinc_masterdatetype'] = 'weekly'
default['backup_manager']['tarballinc_masterdatevalue'] = '1'

default['backup_manager']['mysql_databases'] = '"__ALL__"'
default['backup_manager']['mysql_safedumps'] = 'true'
default['backup_manager']['mysql_adminlogin'] = 'root'
default['backup_manager']['mysql_adminpass'] = ''
default['backup_manager']['mysql_host'] = 'localhost'
default['backup_manager']['mysql_port'] = '3306'
default['backup_manager']['mysql_filetype'] = 'bzip2'

default['backup_manager']['svn_repositories'] = ''
default['backup_manager']['svn_compresswith'] = 'bzip2'

default['backup_manager']['upload_method'] = 'none'
default['backup_manager']['upload_host'] = ''
default['backup_manager']['upload_destination'] = ''

default['backup_manager']['upload_ssh_user'] = ''
default['backup_manager']['upload_ssh_key'] = ''
default['backup_manager']['upload_ssh_hosts'] = ''
default['backup_manager']['upload_ssh_port'] = ''
default['backup_manager']['upload_ssh_destination'] = ''
default['backup_manager']['upload_ssh_purge'] = 'true'
default['backup_manager']['upload_ssh_ttl'] = ''
default['backup_manager']['upload_sshgpg_recipient'] = ''

default['backup_manager']['upload_ftp_secure'] = 'false'
default['backup_manager']['upload_ftp_passive'] = 'true'
default['backup_manager']['upload_ftp_user'] = ''
default['backup_manager']['upload_ftp_password'] = ''
default['backup_manager']['upload_ftp_host'] = ''
default['backup_manager']['upload_ftp_purge'] = 'true'
default['backup_manager']['upload_ftp_ttl'] = ''
default['backup_manager']['upload_ftp_destination'] = ''

default['backup_manager']['upload_s3_destination'] = ''
default['backup_manager']['upload_s3_access_key'] = ''
default['backup_manager']['upload_s3_secret_key'] = ''
default['backup_manager']['upload_s3_purge'] = 'false'

default['backup_manager']['upload_rsync_directories'] = ''
default['backup_manager']['upload_rsync_destination'] = ''
default['backup_manager']['upload_rsync_hosts'] = ''
default['backup_manager']['upload_rsync_dumpsymlinks'] = 'false'

default['backup_manager']['upload_burning_method'] = ''
default['backup_manager']['upload_burning_chkmd5'] = 'false'
default['backup_manager']['upload_burning_device'] = ''
default['backup_manager']['upload_burning_devforced'] = ''
default['backup_manager']['upload_burning_iso_flags'] = '-R -J'
default['backup_manager']['upload_burning_maxsize'] = ''

default['backup_manager']['logger'] = 'true'
default['backup_manager']['logger_level'] = 'warning'
default['backup_manager']['logger_facility'] = 'user'
default['backup_manager']['pre_backup_command'] = ''
default['backup_manager']['post_backup_command'] = ''
