#!/bin/bash

sudo mkdir -p /usr/share/fonts/nvim-nerdfonts
sudo cp -r ./fonts/* /usr/share/fonts/
sudo fc-cache -f -v

# chekc font
# fc-list | grep "font-name"
