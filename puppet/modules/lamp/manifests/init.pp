class lamp {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  package { 'puppet':
    require => Exec['apt-update'],
    ensure => installed,
  }

  package { 'apache2':
    require => Exec['apt-update'],
    ensure => installed,
  }

  service { 'apache2':
    ensure => running,
  }

  package { 'mysql-server':
    require => Exec['apt-update'],
    ensure => installed,
  }

  package { ['php5', 'php5-fpm', 'php5-mysql']:
    require => Exec['apt-update'],
    ensure => installed,
  }

  file { '/var/www/html/info.php':
    ensure => file,
    content => '<?php  phpinfo(); ?>',
    require => Package['apache2'],
  }
}
