class ssh {
	package {'openssh-server':
		ensure => installed,
	}
	service { 'sshd':
		ensure => running,
		enable => true, 
		require => Package['openssh-server'],
	}
	file {'/root/.ssh/authorized_keys':
		source => 'puppet:///modules/ssh/authorized_keys',
		notify => Service['sshd'],
	}
}	
