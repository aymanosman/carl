#!/bin/bash

mkdir -p /code
cd /code
echo Downloading latest release of carl
gsutil cp gs://aosman/carl.tar.gz . 2> /dev/null
tar -xzf carl.tar.gz

echo Writing short nodename of carl into vm.args
cat > releases/0.0.1/vm.args<<EOF
-sname carl

-setcookie carl
EOF

hostserlang=~/.hosts.erlang
echo What is in .hosts.erlang??
cat $hostserlang

cat > $hostserlang<<EOF
'carl@joe'.
'carl@mike'.
EOF



echo Setting HOME to ubuntu, for some reason erlexec complains about this???
echo Old HOME = $HOME
export HOME=/home/ubuntu
echo "Caaarrrlll"
bin/carl start
echo Calling bin/carl rpc net_adm world
bin/carl rpc net_adm world
