# Docker file for provisioning node web server from github

FROM node

WORKDIR /tmp

RUN git clone https://github.com/paulb896/ZoomingMapApp.git /tmp/ZoomingMapApp

WORKDIR /tmp/ZoomingMapApp

RUN npm install

RUN uname -a
RUN ip addr show

EXPOSE 8111
CMD ["--port 8111"]

#ENTRYPOINT node /tmp/ZoomingMapApp/server.js

