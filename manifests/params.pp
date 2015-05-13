#
# == Class: dovecot::params
#
# Defines some variables based on the operating system
#
class dovecot::params {

    include ::os::params

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
