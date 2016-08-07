#
define freeradius::client (
  $secret,
  $order  = 10,
) {

  if ! defined(Class['freeradius']) {
    fail('You must include the freeradius base class before using any freeradius defined resources')
  }

  concat::fragment { "freeradius-client-${name}":
    target  => $::freeradius::clients_file,
    order   => $order,
    content => template('freeradius/client.erb')
  }
}
