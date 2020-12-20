#!/bin/bash
red=`iwgetid | awk '{print $1}'`
essid=`iwgetid -r`
ip_addr=`ip addr show $red | grep '[0-9]*\.' | awk '{print $2}' | sed 's/[/][0-9]*//g' `
echo "$essid ($ip_addr) "
