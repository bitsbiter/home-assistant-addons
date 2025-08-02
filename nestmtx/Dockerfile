# Stage 1: Get the nestmtx binary from its official image
FROM nestmtx/arm64:latest as nestmtx

# Stage 2: Build the addon using the HA base image
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Copy the nestmtx binary from the first stage into our addon
COPY --from=nestmtx /nestmtx /usr/bin/nestmtx

# Copy our custom rootfs directory into the addon
COPY rootfs/ /

# Make the startup script executable
RUN chmod a+x /etc/cont-init.d/nestmtx.sh

# Set the command to run the S6 overlay init system
CMD [ "/init" ]