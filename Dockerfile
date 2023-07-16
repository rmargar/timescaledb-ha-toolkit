FROM --platform=linux/amd64 timescale/timescaledb-ha:pg14.8-ts2.10.3-all
LABEL maintainer="rmargar https://rmargar.net"

USER root
# Install dependencies
RUN apt-get update && apt-get install -y \
    timescaledb-toolkit-postgresql-14

COPY init.sql /docker-entrypoint-initdb.d/

USER postgres
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
