FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://rsyslog.conf \
    file://00-pico.conf \
    file://50-default.conf "

# install logrotate conf
do_install:append () {
    mkdir -p ${D}/etc/rsyslog.d
    rm -rf ${D}/etc/rsyslog.conf
    install -m 644 ${WORKDIR}/rsyslog.conf ${D}/etc/rsyslog.conf
    install -m 644 ${WORKDIR}/00-pico.conf ${D}/etc/rsyslog.d/00-pico.conf
    install -m 644 ${WORKDIR}/50-default.conf ${D}/etc/rsyslog.d/50-default.conf
    sed -i 's,/usr/bin/pkill,/usr/bin/killall,g' ${D}/etc/logrotate.d/logrotate.rsyslog
}
