#
# == Class: dovecot::monit
#
# Setup local monitoring for dovecot using monit
#
class dovecot::monit {
    monit::fragment { 'dovecot-dovecot.monit':
        modulename => 'dovecot',
    }
}
