# Config Hyprland

# Install yay

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

# GNU Stow

- add

```bash
stow hyprland -t ~/.config
```

- delete

```bash
stow -D . -t ~/.config
```

## add .bashrc

```.bash
# add from script install tmux
alias tmux='tmux -u'

alias ls='ls --color=auto'
alias ll='ls -alFh --color=auto'
alias ip='ip -color'
alias tree='tree -C'
alias grep='grep --color=auto'

if [ -f ~/.dircolors ]; then
  eval "$(dircolors -b ~/.dircolors)"
fi

export EDITOR=nvim
export PS1='[\[\e[0;32m\]\u@\h\[\e[0m\]]:\[\e[1;34m\]\w\[\e[0m\] \$ '
alias tmux='tmux -u'
alias vim=nvim
set -o vi

setxkbmap -layout us,th -option grp:win_space_toggle
```

## bluetooth

```bash
sudo pacman -S --needed bluez bluez-utils blueman
sudo systemctl enable --now bluetooth.service
```

## Docker + NVIDIA Container toolkit

- install docker

```bash
sudo pacman -S docker
sudo systemctl enable --now docker
```

- install nvidia-container-toolkit

```bash
sudo pacman -S nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
sudo docker info | grep -i nvidia
```

## Install nvidia driver

```bash
yay -S nvidia-470xx-dkms
yay -S nvidia-580xx-dkms
```

## Config Nvidia DRM

- check grub

```bash
sudo nvim /etc/default/grub
```

- add

```bash
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"
```

- gen config

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
reboot
```

- check monitor

```bash
cat /sys/module/nvidia_drm/parameters/modeset
Y
```

- list monitor

```bash
ls /sys/class/drm/
```

# Printer

```bash
sudo pacman -S cups cups-filters system-config-printer
sudo systemctl enable --now cups
```

# Bluetooth + pactl

- list sink

```bash
pactl list short sinks
```

- get default sinks

```bash
pactl get-default-sink
```

- set default sink

```bash
pactl set-default-sink bluez_output.XX_XX_XX_XX_XX_XX.a2dp-sink
```

- example

```bash
pactl get-default-sink
alsa_output.pci-0000_00_1f.3.analog-stereo

pactl list short sinks
58	alsa_output.pci-0000_00_1f.3.analog-stereo	PipeWire	s32le 2ch 48000Hz	IDLE
311	alsa_output.pci-0000_01_00.1.hdmi-stereo	PipeWire	s32le 2ch 48000Hz	SUSPENDED
325	bluez_output.58:FC:C6:DB:87:72	PipeWire	float32le 2ch 48000Hz	RUNNING

pactl set-default-sink bluez_output.58:FC:C6:DB:87:72
```

# Keyboard

```bash
hyprctl devices
```

# Neovim

```bash
mkdir -p ~/.config/nvim
stow nvim -t ~/.config/nvim
```
