# btrfs shit

https://github.com/Deebble/arch-btrfs-install-guide
https://wiki.archlinux.org/title/Btrfs
https://btrfs.readthedocs.io/en/latest/Introduction.html
https://www.maketecheasier.com/the-beginners-guide-to-btrfs/
https://linux.die.net/man/8/mount
https://docs.oracle.com/en/learn/btrfs-ol8/index.html#introduction
https://github.com/egara/arch-btrfs-installation

1. Remove all partitions
2. Zero the disk
3. Create partition table
  * boot - 1G
  * root - the rest
4. Create btrfs filesystem
  * `mkfs.btrfs -L ROOT /dev/nvme0n1p2`

5. Mount the drive
    * `mount /dev/your_drive2 /mnt`

6. Create swap file (from arch btrfs wiki)

```
btrfs subvolume create /swap
btrfs filesystem mkswapfile --size 32g --uuid clear /swap/swapfile
swapon /swap/swapfile

add to /etc/fstab:
/swap/swapfile none swap defaults 0 0
```

7. Create subvolumes

```
btrfs sub cr /mnt/@
btrfs sub cr /mnt/@tmp
btrfs sub cr /mnt/@log
btrfs sub cr /mnt/@pkg
btrfs sub cr /mnt/@snapshots
btrfs sub cr /mnt/@home

cd..
umount /mnt
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@ /dev/sda2 /mnt
mkdir -p /mnt/{boot/efi,home,var/log,var/cache/pacman/pkg,btrfs,tmp}
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@log /dev/sda2 /mnt/var/log
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@pkg /dev/sda2 /mnt/var/cache/pacman/pkg/
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@tmp /dev/sda2 /mnt/tmp
```

