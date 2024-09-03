SUMMARY = "YANG data modelling language parser and toolkit"
DESCRIPTION = "libyang is YANG data modelling language parser and toolkit written (and providing API) in C. The library is used e.g. in libnetconf2, Netopeer2 or sysrepo projects."
SECTION = "libs"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"

inherit cmake pkgconfig

SRC_URI = "git://github.com/CESNET/libyang.git;protocol=https;branch=devel"

PV = "2.1.55+git${SRCPV}"
SRCREV = "9a4e5b2ce30b9696116d6e654ee55caab5aafed8"

S = "${WORKDIR}/git"

DEPENDS = "libpcre2"

FILES:${PN} += "/usr/share/yang/modules/libyang/*"
