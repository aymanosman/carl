mkdir /code
cd /code
gsutil cp gs://aosman/carl.tar.gz .
tar -xzf carl.tar.gz
bin/carl start
