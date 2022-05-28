#!/bin/bash

# docker gui
docker run -d --privileged -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer

# docker re
docker run -d -v /opt/registry:/var/lib/registry -p 5000:5000 --restart=always --name registry registry
