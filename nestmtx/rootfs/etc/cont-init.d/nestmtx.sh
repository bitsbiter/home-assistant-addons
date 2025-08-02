#!/usr/bin/with-contenv bashio

# ==============================================================================
# Start script for the nestmtx Home Assistant add-on
# ==============================================================================

bashio::log.info "Configuring NestMTX..."

# Get configuration options from the user
declare gcp_project_id
declare gcp_client_id
declare gcp_client_secret
declare gcp_token_path
declare stream_url

gcp_project_id=$(bashio::config 'gcp_project_id')
gcp_client_id=$(bashio::config 'gcp_client_id')
gcp_client_secret=$(bashio::config 'gcp_client_secret')
gcp_token_path=$(bashio::config 'gcp_token_path')
stream_url=$(bashio::config 'stream_url')

# Validate that required configuration is present
if ! bashio::config.has_value 'gcp_project_id' || \
   ! bashio::config.has_value 'gcp_client_id' || \
   ! bashio::config.has_value 'gcp_client_secret' || \
   ! bashio::config.has_value 'stream_url'; then
    bashio::log.fatal "Required configuration options are missing. Please configure the addon."
    exit 1
fi

# Create directory for the Google token if it doesn't exist
token_dir=$(dirname "${gcp_token_path}")
if [[ ! -d "${token_dir}" ]]; then
    bashio::log.info "Creating directory for Google token: ${token_dir}"
    mkdir -p "${token_dir}"
fi

bashio::log.info "Starting NestMTX..."

# Execute the nestmtx binary with the provided configuration
# The binary is located at /nestmtx in the base image.
exec /nestmtx \
    --gcp-project-id "${gcp_project_id}" \
    --gcp-client-id "${gcp_client_id}" \
    --gcp-client-secret "${gcp_client_secret}" \
    --gcp-token-path "${gcp_token_path}" \
    --stream-url "${stream_url}"
