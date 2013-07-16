# == Class: dovecot
#
# This class installs and configures dovecot IMAP/POP3 server. It uses Puppet's 
# certificates for SSL/TLS, and at the moment this behavior cannot be 
# overridden. The certificates are expected to be found from 
# /var/lib/puppet/ssl.
#
# == Parameters
#
# [*allow_ipv4_address*]
#   IPv4 address/subnet from which to allow connections. Defaults to 127.0.0.1.
# [*allow_ipv6_address*]
#   IPv6 address/subnet from which to allow connections. Defaults to ::1.
#
# == Examples
#
# class {'dovecot':
#   allow_ipv4_address => '192.168.0.0/24',
#   allow_ipv6_address => '::1',
# }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license
# See file LICENSE
#
class dovecot(
    $allow_ipv4_address = '127.0.0.1',
    $allow_ipv6_address = '::1',
)
{
    include dovecot::install
    include dovecot::config
    include dovecot::service

    if tagged('monit') {
        include dovecot::monit
    }

    if tagged('packetfilter') {
        class { 'dovecot::packetfilter':
            allow_ipv4_address => $allow_ipv4_address,
            allow_ipv6_address => $allow_ipv6_address,
        }
    }
}
