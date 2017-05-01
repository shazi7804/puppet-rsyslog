# == Class: rsyslog::client
#
# Manages rsyslog as client
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::client': }
#
class rsyslog::client (
  # Boolean $remote_servers,
  $remote_servers,
  String $client_conf,
  String $spool_size,
  Boolean $spool_timeoutenqueue,
  $log_templates,
  $log_filters,
  $property_log_filters,
){
  include ::rsyslog

  File {
    owner   => 'root',
    group   => 'root',
    require => Class['rsyslog::install'],
    notify  => Class['rsyslog::service'],
  }

  file { $client_conf:
    ensure  => file,
    content => template(
      "${module_name}/client/_header.erb",
      "${module_name}/client/config.conf.erb",
      "${module_name}/client/remote.conf.erb",
      ),
  }
}