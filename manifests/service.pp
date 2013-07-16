#
# == Class: dovecot::service
#
# Enable dovecot service
#
class dovecot::service {
    service { 'dovecot':
        name => 'dovecot',
        enable => true,
        require => Class['dovecot::install'],
    }
}

