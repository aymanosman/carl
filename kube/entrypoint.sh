#!/bin/bash

echo Replacing IP: $MY_POD_IP
vmargs=release/0.0.1/vm.args
sed "s/<nodename>/carl@$MY_POD_IP" $vmargs

echo New vm.args is:
cat $vmargs

echo Caaaarrrrll
bin/carl foreground


