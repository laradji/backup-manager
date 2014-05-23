#
# Cookbook Name:: backup-manager
# Recipe:: default
#
# Copyright 2011, Efactures
#
# Apache 2.0
#

# Installing backup-manager

package "backup-manager" do
  action :install
end

# Creating cron entries

cron "backup-manager" do
  minute node.backup_manager.cron_minute
  hour node.backup_manager.cron_hour
  day node.backup_manager.cron_day
  month node.backup_manager.cron_month
  weekday node.backup_manager.cron_week
  path "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
  command "backup-manager >> /dev/null 2>&1"
end

# Generating the configuration file

template "/etc/backup-manager.conf" do
  source "backup-manager.conf.erb"
  owner "root"
  group "root"
  mode 0640
end