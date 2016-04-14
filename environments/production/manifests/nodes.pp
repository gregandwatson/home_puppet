node 'puppet-agent' {
	include nginx
	include iptables
	include ssh
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
}
