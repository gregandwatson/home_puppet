node 'puppet-agent' {
	include nginx
	include iptables
	include ssh
	include sudoers
	include base
	user { 'ggreenlee':
		ensure => present, 
		comment => 'Greg Greenlee',
		home => '/home/ggreenlee',
		managehome => true,
	}
	ssh_authorized_key {'ggreenlee_ssh':
		user => 'ggreenlee',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCoTaAVCxUwaMu9Ot3UszKW4jrLalPZ/6EP6JstS9pWwTWduJHvTj0yCIYqPl/xAchgvYAv1693qn+GzQlPRgK4GDwMZe6NMcSmFCKJetxytH2ozeX48sr1YshCmkXtPGGbwYw/B9amBbZZXBkuuFFvDYGDw9n+blQnRXxtNaLU2AvdQ7OGtFweyFdZUwG14eZjc5KHUd+A7paxE6RWqkx6hU2kh9tccF+VY5aLZz5OGTPwVpOqS1Vx6bWZrzOjIkIvzLNr//iOAkJYYYmjwB9zMu6Gc/a5tR7B4VuxCX3YfljDyQ/QcFTYWxQ1hCNbcKy2LDR0/PDXKxTZQ81+fp+z'
		}
	exec { 'Run my arbitrary command':
	command => 'echo I ran this command on `/bin/date` >/tmp/command.output.txt',
	}	
	exec {'Download public key for John':
		cwd => '/tmp',
		command => '/usr/bin/wget http://bitfieldconsulting.com/files/john.pub',
		creates => '/tmp/john.pub',
		require => Class["base"],

	}
	cron { 'Back up cat-pictures':
		ensure => absent
		#command => '/usr/bin/rsync -az /var/www/cat-pictures/ /cat-pictures.backup/',
		#hour => '04',
		#minute => '00',
	}
	
	file {'/usr/share/nginx/cat-pictures':
		ensure => directory,
	}
	file {'/usr/share/nginx/cat-pictures/img':
		source => 'puppet:///modules/cat-pictures/img',
		recurse => true,
		require => File['/usr/share/nginx/cat-pictures'],
	}
}
