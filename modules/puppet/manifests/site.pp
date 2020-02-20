
node default {
	notify { 'Hello from Puppet Server!':}
}

node agent-muppet {
	include muppet
}
