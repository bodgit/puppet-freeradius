#
class freeradius::install {

  package { $::freeradius::package_name:
    ensure => $::freeradius::package_ensure,
  }
}
