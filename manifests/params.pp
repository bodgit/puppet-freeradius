#
class freeradius::params {

  case $::osfamily {
    'RedHat': {
      $user           = 'radiusd'
      $group          = 'radiusd'
      $package_name   = 'freeradius'
      $service_name   = 'radiusd'
      $service_ensure = 'running'
      $service_enable = true
      $conf_dir       = '/etc/raddb'
      $mod_packages   = {
        'ldap'  => "${package_name}-ldap",
        'utils' => "${package_name}-utils",
      }
      $users_file     = "${conf_dir}/mods-config/files/authorize"
      $clients_file   = "${conf_dir}/clients.conf"
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.") # lint:ignore:80chars
    }
  }
}
