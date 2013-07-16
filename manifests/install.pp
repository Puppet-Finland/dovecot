#
# == Class dovecot::install
#
# Installs dovecot package
#
class dovecot::install {

    package { 'dovecot-dovecot':
        name => 'dovecot-imapd',
        ensure => installed,
    }
}
