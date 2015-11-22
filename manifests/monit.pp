#
# == Class: dovecot::monit
#
# Setup local monitoring for dovecot using monit
#
class dovecot::monit inherits dovecot::params
{
    monit::fragment { 'dovecot-dovecot.monit':
        basename   => 'dovecot',
        modulename => 'dovecot',
    }
}
