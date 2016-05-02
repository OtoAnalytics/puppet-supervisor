define supervisord::program (
  $command,
  $user = undef,
  $environment = undef,
) {
  include supervisord
  $config_d = $supervisord::config_d

  file { "${config_d}/program_${name}.ini":
    content => template('supervisord/program.erb'),
    notify  => Service['supervisord'],
  }
}
