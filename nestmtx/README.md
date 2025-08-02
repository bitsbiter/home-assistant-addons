# Home Assistant Add-on: NestMTX

This addon integrates `nestmtx` into Home Assistant, allowing you to re-stream your Google Nest camera's WebRTC feed as RTSP, HLS, or MJPEG.

## Configuration

The addon requires configuration before it can be started.

-   **`gcp_project_id`**: Your Google Cloud Project ID.
-   **`gcp_client_id`**: Your Google Cloud OAuth Client ID.
-   **`gcp_client_secret`**: Your Google Cloud OAuth Client Secret.
-   **`gcp_token_path`**: The path to store your Google authentication token. The default is `/share/nestmtx/google_token.json`, which is recommended. You will need to create the `/share/nestmtx` directory.
-   **`stream_url`**: The WebRTC stream URL from your camera. You can get this from your Google Home app or Nest account.

## Usage

Once configured and started, the addon will provide the following stream URLs, which you can use in Home Assistant's generic camera integration or other clients:

-   **RTSP**: `rtsp://<home-assistant-ip>:8554/stream`
-   **HLS**: `http://<home-assistant-ip>:8555/stream.m3u8`
-   **MJPEG**: `http://<home-assistant-ip>:8556/stream`

Replace `<home-assistant-ip>` with the actual IP address of your Home Assistant instance.
