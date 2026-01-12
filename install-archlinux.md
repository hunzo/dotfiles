# Install Arch linux

# Create disk layout and file system

| partition      | description |
| -------------- | ----------- |
| /dev/nvme0n1p1 | /boot/efi   |
| /dev/nvme0n1p2 | /           |

```bash
$ mkfs.fat -F 32 /dev/nvme0n1p1 # on EFI System partition
$ mkfs -t ext4 /dev/nvme0n1p2   # on Linux filesystem partition
$ mkswap /dev/nvme0n1p3         # on Linux swap partition
```

- mount

```bash
$ mount /dev/nvme0n1p2 /mnt
$ mkdir -p /mnt/boot/efi
$ mount /dev/nvme0n1p1 /mnt/boot/efi
$ swapon /dev/nvme0n1p3
```

- check

```bash
lsblk
```

- install

```bash
archinstall
```

## chroot

## Manual edit mkinitcpio.conf

- enable gpu nvidia edit file /etc/mkinitcpio.conf
- run

```bash
sudo mkinitcpio -P

```

- boot loader using grub

- grub config

```bash
$ pacman -S grub efibootmgr os-prober
$ grub-install /dev/nvme0n1
$ grub-mkconfig -o /boot/grub/grub.cfg
```

## remove os-prober

- edit /etc/default/grub
