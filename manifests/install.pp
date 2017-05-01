# == Class: rsyslog::install
#
# This class makes sure that the required packages are installed
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::install': }
#
class rsyslog::install {
  if $rsyslog::rsyslog_package_name {
    package { $rsyslog::rsyslog_package_name:
      ensure => $rsyslog::package_ensure,
      notify => Class['rsyslog::service'],
    }
  }

  if $rsyslog::relp_package_name {
    package { $rsyslog::relp_package_name:
      ensure => $rsyslog::package_ensure,
      notify => Class['rsyslog::service'],
    }
  }

  if $rsyslog::mysql_package_name {
    package { $rsyslog::mysql_package_name:
      ensure => $rsyslog::package_ensure,
      notify => Class['rsyslog::service'],
    }
  }

  if $rsyslog::gnutls_package_name {
    package { $rsyslog::gnutls_package_name:
      ensure => $rsyslog::package_ensure,
      notify => Class['rsyslog::service'],
    }
  }
}
