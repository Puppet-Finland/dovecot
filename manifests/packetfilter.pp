#
# == Class: dovecot::packetfilter
#
# Limits access to dovecot server based on IP-address/range
#
class dovecot::packetfilter
(
    $allow_ipv4_address,
    $allow_ipv6_address

) inherits dovecot::params
{

    Firewall {
        chain  => 'INPUT',
        proto  => 'tcp',
        port   => 993,
        action => 'accept',
    }

    # IPv4 rules
    firewall { '013 ipv4 accept imaps port':
        provider => 'iptables',
        source   => $allow_ipv4_address,
    }

    # IPv6 rules
    firewall { '013 ipv6 accept imaps port':
        provider => 'ip6tables',
        source   => $allow_ipv6_address,
    }
}
