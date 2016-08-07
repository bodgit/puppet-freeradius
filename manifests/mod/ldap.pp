class freeradius::mod::ldap (
  $server,
  $port             = 389,
  $access_attribute = undef,
) {

  ::freeradius::mod { 'ldap': }

  file { "${::freeradius::mod_dir}/ldap":
    ensure  => file,
    owner   => 0,
    group   => $::freeradius::group,
    mode    => '0640',
    content => template('freeradius/mod/ldap.erb'),
    notify  => Class['::freeradius::service'],
  }
}
