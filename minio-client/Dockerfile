FROM minio/mc:latest

ARG USERNAME=minio-client
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

COPY --chown=$USER_UID:$USER_GID ./scripts/ /scripts/

USER $USER_UID:$USER_GID

WORKDIR /scripts

ENTRYPOINT ["/scripts/setup.sh"]