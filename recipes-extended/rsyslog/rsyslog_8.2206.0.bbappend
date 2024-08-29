FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://pico.conf "

# install logrotate conf
do_install:append () {
    echo "\$EscapeControlCharactersOnReceive off" >> ${D}/etc/rsyslog.conf
    mkdir -p ${D}/etc/rsyslog.d
    install -m 644 ${WORKDIR}/pico.conf ${D}/etc/rsyslog.d/pico.conf
    sed -i 's,/usr/bin/pkill,/usr/bin/killall,g' ${D}/etc/logrotate.d/logrotate.rsyslog
}
