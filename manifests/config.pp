#
# == Class: dovecot::config
#
# Configures Dovecot IMAP/POP3 server
#
class dovecot::config inherits dovecot::params {

    file { 'dovecot-dovecot.conf':
        ensure  => present,
        name    => $::dovecot::params::config_name,
        content => template('dovecot/dovecot.conf.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
        require => Class['dovecot::install'],
        notify  => Class['dovecot::service'],
    }
}
