FROM alpine:3.24.1

RUN apk add --no-cache \
  bash \
  mongodb-tools \
  curl \
  python3 \
  py3-pip \
  py3-crcmod \
  && pip3 install --break-system-packages --upgrade pip \
  && pip3 install --break-system-packages gsutil

ADD . /mongodb-gcs-backup
WORKDIR /mongodb-gcs-backup

RUN chmod +x /mongodb-gcs-backup/backup.sh

ENTRYPOINT ["/mongodb-gcs-backup/backup.sh"]
