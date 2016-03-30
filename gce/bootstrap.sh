#!/bin/bash
set -e

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

echo Setting HOME to ubuntu, for some reason erlexec complains about this???
export HOME=/home/ubuntu
hostserlang=~/.hosts.erlang
echo What is in .hosts.erlang? $hostserlang
cat $hostserlang || true

cat > $hostserlang<<EOF
'carl@joe'.
'carl@mike'.
EOF

cat $hostserlang || true

echo "Caaarrrlll"
bin/carl start
echo Calling bin/carl rpc net_adm world
bin/carl rpc net_adm host_file
bin/carl rpc net_adm world # Why doesn't this work???
bin/carl rpc net_adm ping carl@joe.
bin/carl rpc net_adm ping carl@mike.
bin/carl rpc erlang nodes
