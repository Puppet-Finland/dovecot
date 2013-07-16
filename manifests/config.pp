#
# == Class: dovecot::config
#
# Configures Dovecot IMAP/POP3 server
#
class dovecot::config {

    file { 'dovecot-dovecot.conf':
        name => '/etc/dovecot/dovecot.conf',
        content => template('dovecot/dovecot.conf.erb'),
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,  
        require => Class['dovecot::install'],
        notify => Class['dovecot::service'],
    }
}
