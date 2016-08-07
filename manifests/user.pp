#
define freeradius::user (
  $check_items = [],
  $reply_items = [],
  $order       = 10,
) {

  if ! defined(Class['freeradius']) {
    fail('You must include the freeradius base class before using any freeradius defined resources')
  }

  validate_array($check_items)
  validate_array($reply_items)

  concat::fragment { "freeradius-user-${name}":
    target  => $::freeradius::users_file,
    order   => $order,
    content => template('freeradius/user.erb')
  }
}
