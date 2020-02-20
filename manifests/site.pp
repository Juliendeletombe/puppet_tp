node 'agent-test' , 'agent-test2'  {
	package { python3:
	        ensure => 'installed'
	}

	package {'python3-pip':
	        ensure => 'installed'
	}

	package {'pygame':
	        ensure => 'installed',
	        provider => 'pip3',
	}

	exec {'ssh-keygen':
	        command => '/usr/bin/ssh-keygen -f /root/.ssh/id_rsa -N ""',
	        creates => '/root/.ssh/id_rsa'
	}
}

node default {
	notify {'Hello from Puppet Server!':}
}
