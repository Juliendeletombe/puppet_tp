class muppet(
  $muppetname = "$muppetname"  
) {

  group { "$muppetname":
    ensure => present,
    # Le before ne sert à rien car il est déjà dans File
    before => File["/home/$muppetname"],
  }

  user { "$muppetname":
    require => Group["$muppetname"],
    before => File["/home/$muppetname"],
    ensure => present,
    gid => "$muppetname",
    home => "/home/$muppetname",
    shell => "/bin/bash",
  }

  file { "/home/$muppetname":
    ensure => directory,
    owner => "$muppetname",
    group => "$muppetname",
    before => File["/home/$muppetname/.profile"],
  }

  file { "/home/$muppetname/.profile":
    ensure => file,
    content => epp('muppet/.profile.epp', {
      muppetname => "$muppetname"
    }),
    owner => "$muppetname",
    group => "$muppetname",
  }
}
