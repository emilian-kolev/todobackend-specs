FROM ubuntu:trusty

ENV TEEM=xterm-256color

RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

# Install app dependencies
RUN npm install -g mocha && \
    npm install

# Set MOCHA test runner as entrypoint
ENTRYPOINT [ "mocha" ]