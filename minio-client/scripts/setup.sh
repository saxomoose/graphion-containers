#!/bin/bash
# If not yet initialized, create unprivileged user and default bucket on minio server. Otherwise, no op.
if ! mc alias ls | grep -q "$MINIO_HOST"; then
  mc alias set $MINIO_HOST http://$MINIO_HOST:$MINIO_PORT $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
  mc admin user add $MINIO_HOST $MINIO_UNPRIV_USER $MINIO_UNPRIV_PASSWORD
  mc admin policy attach $MINIO_HOST readwrite --user $MINIO_UNPRIV_USER
  mc mb --ignore-existing $MINIO_HOST/$MINIO_ADMIN_BUCKET
  mc mb --ignore-existing $MINIO_HOST/$MINIO_TEST_BUCKET
  mc cp --recursive ./certs/ $MINIO_HOST/$MINIO_ADMIN_BUCKET/certs

else
  echo "Server already initialized."
fi
sleep infinity
