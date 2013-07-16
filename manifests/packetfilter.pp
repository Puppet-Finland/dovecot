#
# == Class: dovecot::packetfilter
#
# Limits access to dovecot server based on IP-address/range
#
class dovecot::packetfilter(
    $allow_ipv4_address,
    $allow_ipv6_address
)
{

    # IPv4 rules
    firewall { '013 ipv4 accept imaps port':
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'tcp',
        port => 993,
        source => "$allow_ipv4_address",
        action => 'accept',
    }

    # IPv6 rules
    firewall { '013 ipv6 accept imaps port':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'tcp',
        port => 993,
        source => "$allow_ipv6_address",
        action => 'accept',
    }

}
