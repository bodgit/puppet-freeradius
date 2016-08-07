#
class freeradius::config {

  concat { $::freeradius::users_file:
    ensure => present,
    owner  => 0,
    group  => $::freeradius::user,
    mode   => '0640',
  }

  concat::fragment { 'freeradius-user-header':
    target  => $::freeradius::users_file,
    order   => 0,
    content => "# Managed by Puppet\n",
  }

  concat { $::freeradius::clients_file:
    ensure => present,
    owner  => 0,
    group  => $::freeradius::user,
    mode   => '0640',
  }

  concat::fragment { 'freeradius-client-header':
    target  => $::freeradius::clients_file,
    order   => 0,
    content => "# Managed by Puppet\n",
  }
}
