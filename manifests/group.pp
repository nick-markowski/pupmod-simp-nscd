# Class: nscd::group
#
# Set up the materials for the nscd 'group' service.
#
# See nscd.conf(5) for a description of all variables.
#
# == Authors
#   * Trevor Vaughan <tvaughan@onxypoint.com>
#
class nscd::group (
  $enable_cache = 'yes',
  $positive_ttl = '600',
  $negative_ttl = '20',
  $suggested_size = '211',
  $check_files = 'yes',
  $persistent = 'yes',
  $shared = 'yes',
  $max_db_size = '33554432',
  $auto_propogate = 'yes'
) {
  include 'nscd'

  $svc_name = 'group'

  concat_fragment { "nscd+conf.$svc_name":
    content => template('nscd/nscd.service.erb')
  }

  validate_array_member($enable_cache,['yes','no'])
  validate_integer($positive_ttl)
  validate_integer($negative_ttl)
  validate_integer($suggested_size)
  validate_array_member($check_files,['yes','no'])
  validate_array_member($persistent,['yes','no'])
  validate_array_member($shared,['yes','no'])
  validate_integer($max_db_size)
  validate_array_member($auto_propogate,['yes','no'])
}
