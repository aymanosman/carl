wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get update
sudo apt-get install esl-erlang -y

gsutil cp gs://aosman/carl.tar.gz .
tar -xzf carl.tar.gz
rel/carl/bin/carl start
