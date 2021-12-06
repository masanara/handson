ROOTFS=$(mktemp -d); echo $ROOTFSROOTFS=$(mktemp -d); echo $ROOTFS
docker export $(docker create centos:7) | tar xf - -C $ROOTFS
echo $ROOTFS
ls –l $ROOTFS
unshare -uinpUrf --mount-proc chroot $ROOTFS bash
