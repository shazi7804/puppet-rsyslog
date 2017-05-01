# == Class: rsyslog
#
# Meta class to install rsyslog with a basic configuration.
# You probably want rsyslog::client or rsyslog::server
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog': }
#
class rsyslog (
  String $rsyslog_package_name,
  String $package_ensure,
  String $relp_package_name,
  String $gnutls_package_name,
  String $mysql_package_name,
  String $pgsql_package_name,
  String $rsyslog_d,
  Boolean $purge_rsyslog_d,
  String $rsyslog_conf,
  String $rsyslog_default,
  String $spool_dir,
  String $service_name,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
  Optional[String] $local_host_name = undef,
  Array $modules,
  String $max_message_size,
  String $system_log_rate_limit_interval,
  String $syslog,
  String $authpriv_file,
  String $mail_file,
  String $cron_file,
){
  contain rsyslog::install
  contain rsyslog::config
  contain rsyslog::service

  Class['::rsyslog::install']
  -> Class['::rsyslog::config']
  ~> Class['::rsyslog::service']
}