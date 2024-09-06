FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = "file://profile.patch \
                  file://fstab.patch"
