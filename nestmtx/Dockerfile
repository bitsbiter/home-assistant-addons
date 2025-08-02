# Dockerfile for nestmtx Home Assistant Add-on
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set environment variables
ENV LANG C.UTF-8

# Copy rootfs contents, which includes our startup script
COPY rootfs/ /

# Make the startup script executable
RUN chmod +x /etc/cont-init.d/nestmtx.sh

# Set the command to our custom startup script
CMD [ "/init" ]
