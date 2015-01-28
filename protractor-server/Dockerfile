#FROM dockerfile/nodejs-bower-grunt
#RUN apt-get install libxss1 libappindicator1 libindicator7
##RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN dpkg -i google-chrome*.deb



#WORKDIR /etc/init.d/
#RUN wget https://gist.githubusercontent.com/jterrace/2911875/raw/dee3521ed340bcb99ad721ae9f36e6c4b0a225de/xvfb
#RUN wget https://raw.githubusercontent.com/gmonfort/xvfb-init/master/Xvfb
#RUN sudo chown root:root /etc/init.d/xvfb
#RUN sudo chmod a+x /etc/init.d/xvfb
#RUN sudo update-rc.d  /etc/init.d/xvfb defaults
#RUN sudo /etc/init.d/xvfb start



#FROM keyvanfatehi/chrome-xvfb
#docker pull keyvanfatehi/chrome-xvfb


#RUN apt-get install nodejs
#RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN \
#  apt-get update && \
#  apt-get install -y python python-dev python-pip python-virtualenv && \
#  rm -rf /var/lib/apt/lists/*

#RUN \
#  cd /tmp && \
#  wget http://nodejs.org/dist/node-latest.tar.gz && \
#  tar xvzf node-latest.tar.gz && \
#  rm -f node-latest.tar.gz && \
#  cd node-v* && \
#  ./configure && \
#  cd /tmp && \
#  rm -rf /tmp/node-v* && \
#  npm install -g npm && \
#  echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

#FROM c12e/docker-nodejs-xvfb

#RUN npm install -g protractor
FROM shuron/protractor
WORKDIR /tmp
