# This ARG is passed in by the Home Assistant build environment.
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install curl (for downloading), make the /usr/bin directory, and then clean up.
# The RUN command is a single layer to keep the image smaller.
RUN \
    apk add --no-cache curl && \
    echo "Downloading nestmtx binary..." && \
    curl -L -o /usr/bin/nestmtx \
    "https://github.com/alexbelgium/hassio-addons/releases/download/v1.2.0/nestmtx-arm64" && \
    echo "Setting permissions..." && \
    chmod a+x /usr/bin/nestmtx && \
    apk del curl

# Copy our custom rootfs directory (which contains the startup script) into the addon.
COPY rootfs/ /

# Set the command to run the S6 overlay init system.
CMD [ "/init" ]