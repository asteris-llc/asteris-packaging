#!/bin/bash
set -ex

for i in "$@"
do
case $i in
    --package=*)
    PACKAGE="${i#*=}"
    shift # past argument=value
    ;;
    --bintray_user=*)
    export BINTRAY_USER="${i#*=}"
    shift # past argument=value
    ;;
    --bintray_api_key=*)
    export BINTRAY_API_KEY="${i#*=}"
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac
done

case "$PACKAGE" in

mesos) echo "Packaging MESOS"
       ./pkg/package-mesos.sh
;;
calico) echo "Packaging CALICO"
       ./pkg/package-calico.sh
;;
consul) echo "Packaging CONSUL"
       ./pkg/package-consul.sh
;;
esac
