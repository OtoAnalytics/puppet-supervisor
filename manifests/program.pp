# This define manages a supervisor program
#
# @example
#   supervisord::program { 'puppetboard':
#     command => "${virtualenv_path}/bin/uwsgi --socket ${sock} --wsgi-file ${wsgi_file} -H ${virtualenv_path} --chown-socket=nginx:nginx",
#     user    => 'nginx',
#     require => File['puppetboard.wsgi']
#   }
#
define supervisord::program (
  $command,
  $user        = undef,
  $environment = undef,
) {
  include supervisord
  $config_d = $supervisord::config_d

  file { "${config_d}/program_${name}.ini":
    content => template('supervisord/program.erb'),
    notify  => Service['supervisord'],
  }
}
