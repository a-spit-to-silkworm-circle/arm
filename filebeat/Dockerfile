FROM ubuntu:focal
COPY filebeat-7.14.1-arm64.deb /
COPY filebeat.yaml /opt
RUN apt-get install -yq /filebeat-7.14.1-arm64.deb
CMD filebeat -e -c /opt/filebeat.yaml
CMD ["/usr/bin/filebeat","-c","/opt/filebeat.yaml","-e"]
