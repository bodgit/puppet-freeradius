define freeradius::mod (
  $package = undef,
) {
  if ! defined(Class['freeradius']) {
    fail('You must include the freeradius base class before using any freeradius defined resources')
  }
}
