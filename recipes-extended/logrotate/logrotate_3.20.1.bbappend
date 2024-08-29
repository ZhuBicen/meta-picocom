FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://pico_log "


# install logrotate conf
do_install:append () {
    install -m 644 ${WORKDIR}/pico_log ${D}/etc/logrotate.d/pico_log
    mkdir -p ${D}/etc/cron.hourly
    cp ${D}/etc/cron.daily/logrotate ${D}/etc/cron.hourly/logrotate
    sed -i 's,/etc/logrotate.conf,/etc/logrotate.d/pico_log,g' ${D}/etc/cron.hourly/logrotate
}
