FROM minio/mc:latest

ENTRYPOINT mc alias set minio-server http://minio-server:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD \
    && mc admin user add minio-server $MINIO_UNPRIV_USER $MINIO_UNPRIV_PASSWORD \
    # Disables anonymous access to minio-server.
    # && mc anonymous set none minio-server \
    # Grants read and write permissions for all buckets and objects on minio-server to user.
    && mc admin policy set minio-server readwrite user=$MINIO_UNPRIV_USER
