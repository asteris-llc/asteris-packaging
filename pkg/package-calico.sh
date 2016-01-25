#!/bin/bash
set -ex

yum install -y git
git clone https://github.com/asteris-llc/calico-packaging.git

adduser vagrant
cd calico-packaging
./scripts/bootstrap.sh

# Package
/home/vagrant/go/bin/hammer build --search=/calico-packaging --output=`pwd`/out

# Upload
./scripts/bintray.sh

# Finish the task
curl -u $MARATHON_CREDS --insecure -X DELETE https://marathon.service.consul:8080/v2/apps/calico-packaging
