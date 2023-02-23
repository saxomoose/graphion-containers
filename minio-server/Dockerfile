FROM minio/minio:latest

COPY minio-server.conf /etc/minio-server.conf

CMD ["server", "--console-address", ":9001", "/data"]