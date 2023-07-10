FROM timescale/timescaledb-ha:pg14.8-ts2.10.3-all-oss
LABEL maintainer="rmargar https://rmargar.net"

USER root
# Install dependencies
RUN apt-get update && apt-get install -y \
    timescaledb-toolkit-postgresql-14

USER postgres
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
