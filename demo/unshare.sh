ROOTFS=$(mktemp -d); echo $ROOTFS
docker export $(docker create centos:7) | tar xf - -C $ROOTFS
echo $ROOTFS
ls –l $ROOTFS
which python
which python3
unshare -uinpUrf --mount-proc chroot $ROOTFS bash

---

mount -t proc proc /proc
mount -t devpts devpts /dev/pts

python -V
