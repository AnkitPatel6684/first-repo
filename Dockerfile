FROM ubuntu:latest

# Create app directory
WORKDIR /usr/app
#RUN rm -rf /etc/apt/trusted.gpg.d/*
RUN apt --fix-broken install
RUN apt-get install gnupg -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 871920D1991BC93C
RUN apt-get update
RUN apt-get install nodejs -y
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
