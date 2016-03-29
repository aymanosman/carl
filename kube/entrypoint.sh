#!/bin/bash

echo Replacing IP: $MY_POD_IP

sed "s/<nodename>/carl@$MY_POD_IP"


