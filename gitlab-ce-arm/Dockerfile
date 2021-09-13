FROM ubuntu:focal

MAINTAINER a-spit-to-silkworm-circle

ENV LANG=C.UTF-8
ENV PATH=/opt/gitlab/embedded/bin:/opt/gitlab/bin:/assets:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV TERM=xterm

RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends curl openssh-server ca-certificates tzdata perl
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN apt-get -y install gitlab-ce
RUN rm -f /etc/gitlab/gitlab.rb
COPY gitlab.rb /etc/gitlab/
RUN nohup /opt/gitlab/embedded/bin/runsvdir-start &
RUN gitlab-ctl reconfigure

VOLUME ["/etc/gitlab", "/var/opt/gitlab", "/var/log/gitlab"]
EXPOSE 443 80 22

CMD ["gitlab-ctl","start"]

HEALTHCHECK --interval=60s --timeout=30s --retries=5 \
    CMD /opt/gitlab/bin/gitlab-healthcheck --fail --max-time 10
