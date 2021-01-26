# Description
Custom docker container for ADB service used for Android TVs as remote server for Home Assistant. Unlike built-in server in HA this server has its own generated key and can establish a new connection (note that HASSIO unlike core version does support similar functionality).

## Docker run details
Set environment variable `TV_IPS` to IP address of Android TV. In case of multiple IPs separate them using space symbol.
Expose port 5037.

## Docker Hub
https://hub.docker.com/repository/docker/chomupashchuk/custom-adb
