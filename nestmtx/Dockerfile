# This ARG is passed in by the Home Assistant build environment.
ARG BUILD_FROM

# Stage 1: Get the nestmtx binary from the official arm64 image
FROM nestmtx/arm64:latest AS nestmtx

# Stage 2: Build the final addon using the HA base image for aarch64
FROM ${BUILD_FROM}

# Copy the nestmtx binary from the first stage into our addon
COPY --from=nestmtx /nestmtx /usr/bin/nestmtx

# Copy our custom rootfs directory into the addon
COPY rootfs/ /

# Make the startup script executable
RUN chmod a+x /etc/cont-init.d/nestmtx.sh

# Set the command to run the S6 overlay init system
CMD [ "/init" ]
