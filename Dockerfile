FROM centos:7

COPY packaging.sh /packaging.sh
COPY pkg /pkg
ENTRYPOINT ["/packaging.sh"]

