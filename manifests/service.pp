#
class freeradius::service {

  service { $::freeradius::service_name:
    ensure => $::freeradius::service_ensure,
    enable => $::freeradius::service_enable,
  }
}
