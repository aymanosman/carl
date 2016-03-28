#!/bin/bash

mkdir -p /code
cd /code
echo Downloading latest release of carl
gsutil cp gs://aosman/carl.tar.gz . 2> /dev/null
tar -xzf carl.tar.gz

name=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/name -H "Metadata-Flavor: Google")
echo Writing short nodename of $name into vm.args
cat > releases/0.0.1/vm.args<<EOF
-sname $name

-setcookie carl
EOF
echo Setting HOME to ubuntu, for some reason erlexec complains about this???
echo Old HOME = $HOME
export HOME=/home/ubuntu
echo "Caaarrrlll"
bin/carl start
