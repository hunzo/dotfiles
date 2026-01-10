#!/bin/bash
# sudo dmesg | grep ttyUSB*
sudo minicom --device /dev/ttyUSB0 --baudrate 9600

# sudo apt install piccom -y
# sudo picocom -b 115200 /dev/ttyUSB0
