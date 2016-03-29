#!/bin/bash
set -e

echo Replacing IP: $MY_POD_IP
vmargs=releases/0.0.1/vm.args
echo PWD $PWD
echo ls $(ls)
sed "s/<nodename>/carl@$MY_POD_IP/" $vmargs

echo New vm.args is:
cat $vmargs

echo Caaaarrrrll
bin/carl foreground


