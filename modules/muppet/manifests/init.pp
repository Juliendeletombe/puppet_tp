class muppet {
    
    group { 'kermit':
      ensure => present,
    }

    user { 'kermit':
      require => Group['kermit'],
      ensure => present,
      gid => 'kermit',
      home => "/home/kermit",
      shell => "/bin/bash",
      
    }

    file { '/home/kermit':
      ensure => directory,
      owner => 'kermit',
      group => 'kermit',
      before => File['/home/kermit/.profile'],
    }  

    file { "/home/kermit/.profile":
      ensure => file,
      content => "echo 'Hello from kermit'",
      owner => 'kermit',
      group => 'kermit',
      }

}
