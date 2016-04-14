class iptables {
	service { 'iptables':
		ensure => stopped,
		enable => false,
	}
}
