# This class installs and configures supervisord
#
# @example
#   include supervisord
#
class supervisord (
  $package_name,
  $config_d,
  $config_file,
  $log_file,
  $pid_file,
){

  $includes = "${config_d}/*.ini"

  package { $package_name: }

  service { 'supervisord':
    ensure  => running,
    enable  => true,
    require => Package[$package_name],
  }

  file { $config_file:
    content => template('supervisord/supervisord.conf.erb'),
    notify  => Service['supervisord'],
  }

  file { $config_d:
    ensure  => directory,
    purge   => true,
    recurse => true,
  }
}
