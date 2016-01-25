#!/bin/bash

yum install -y git
git clone https://github.com/asteris-llc/mesos-packaging.git

cd mesos-packaging
./scripts/bootstrap.sh
./scripts/mesos.sh

/home/vagrant/go/bin/hammer build --search=/mesos-packaging --output=`pwd`/out

./scripts/bintray.sh

curl -u $MARATHON_CREDS --insecure -X DELETE https://marathon.service.consul:8080/v2/apps/mesos-packaging
