FROM google/cloud-sdk:alpine

COPY pipe /
COPY LICENSE.txt pipe.yml README.md /

ENTRYPOINT ["/pipe.sh"]
