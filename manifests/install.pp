#
# == Class dovecot::install
#
# Installs dovecot package
#
class dovecot::install inherits dovecot::params {

    package { 'dovecot-dovecot':
        ensure => installed,
        name   => $::dovecot::params::package_name,
    }
}
