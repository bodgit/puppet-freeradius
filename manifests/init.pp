#
class freeradius (
  $user           = $::freeradius::params::user,
  $group          = $::freeradius::params::group,
  $package_name   = $::freeradius::params::package_name,
  $package_ensure = $::freeradius::params::package_ensure,
  $users_file     = $::freeradius::params::users_file,
  $clients_file   = $::freeradius::params::clients_file,
) inherits ::freeradius::params {

  include ::freeradius::install
  include ::freeradius::config
  include ::freeradius::service

  anchor { 'freeradius::begin': }
  anchor { 'freeradius::end': }

  Anchor['freeradius::begin'] -> Class['::freeradius::install']
    ~> CLass['::freeradius::config'] ~> Class['::freeradius::service']
    -> Anchor['freeradius::end']
}
