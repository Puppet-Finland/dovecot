#
# == Class: dovecot::params
#
# Defines some variables based on the operating system
#
class dovecot::params {

    include ::os::params
    include ::puppetagent::params

    $ssl_cert_file = "${::puppetagent::params::ssldir}/certs/${::fqdn}.pem"
    $ssl_key_file = "${::puppetagent::params::ssldir}/private_keys/${::fqdn}.pem"

    case $::osfamily {
        'Debian': {
            $package_name = 'dovecot-imapd'
            $config_name = '/etc/dovecot/dovecot.conf'
            $service_name = 'dovecot'
            $pidfile = '/var/run/dovecot/master.pid'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }

    if str2bool($::has_systemd) {
        $service_start = "${::os::params::systemctl} start ${service_name}"
        $service_stop = "${::os::params::systemctl} stop ${service_name}"
    } else {
        $service_start = "${::os::params::service_cmd} ${service_name} start"
        $service_stop = "${::os::params::service_cmd} ${service_name} stop"
    }
}
