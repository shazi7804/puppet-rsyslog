# == Class: rsyslog::config
#
# Full description of class role here.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::config': }
#
class rsyslog::config {

  File {
    owner   => 'root',
    group   => 'root',
    require => Class['rsyslog::install'],
    notify  => Class['rsyslog::service'],
  }

  file { $rsyslog::rsyslog_d:
    ensure  => directory,
    purge   => $rsyslog::purge_rsyslog_d,
    recurse => true,
    force   => true,
  }

  file { $rsyslog::rsyslog_conf:
    ensure  => file,
    content => template("${module_name}/rsyslog.conf.erb"),
  }

  file { $rsyslog::spool_dir:
    ensure  => directory,
    owner   => 'root',
    mode    => '0700',
    seltype => 'syslogd_var_lib_t',
  }
}