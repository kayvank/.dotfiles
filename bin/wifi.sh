#!/usr/bin/bash
# wifi connection script
# may also use nmui

nmcli device wifi list 
echo "enter PASSWORD for kaz:  "

read PASSWORD

nmcli device wifi connect kaz password  $PASSWORD
nmcli connection show

