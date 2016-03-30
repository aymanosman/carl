#!/bin/bash
set -e

# wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
# sudo dpkg -i erlang-solutions_1.0_all.deb

# sudo apt-get update
# sudo apt-get install esl-erlang -y

hostserlang=/home/vagrant/.hosts.erlang
echo What is in .hosts.erlang?? $hostserlang

cat > $hostserlang<<EOF
'carl@joe'.
'carl@mike'.
EOF

cat $hostserlang

cd /home/vagrant/code
tar -xzf carl.tar.gz
# export HOME=/home/vagrant
bin/carl start
bin/carl rpc net_adm world
