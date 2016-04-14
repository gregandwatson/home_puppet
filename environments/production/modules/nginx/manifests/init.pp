class nginx {
    package{ 'httpd':
		ensure => absent,
	}
    package { 'nginx':
		ensure => installed,
	}

    service { 'nginx':
		ensure => running,
		require => Package['nginx'],
	    }

    file { '/etc/yum.repos.d/nginx.repo':
		ensure => present,
		source => 'puppet:///modules/nginx/nginx.repo',
		before => Package['nginx'],
	}
    file { '/etc/nginx/conf.d/cat-pictures.conf':
		ensure => present,
		source => 'puppet:///modules/nginx/cat-pictures.conf',
		require=> Package['nginx'],
		notify => Service['nginx'],
	}
}
