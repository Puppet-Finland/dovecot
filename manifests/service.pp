#
# == Class: dovecot::service
#
# Enable dovecot service
#
class dovecot::service inherits dovecot::params
{

    service { 'dovecot':
        name    => $::dovecot::params::service_name,
        enable  => true,
        require => Class['dovecot::install'],
    }
}

