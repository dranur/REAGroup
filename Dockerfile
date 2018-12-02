FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y bundler

RUN git clone https://github.com/rea-cruitment/simple-sinatra-app.git
RUN cd /simple-sinatra-app && /usr/bin/bundle install
RUN cd /simple-sinatra-app && /usr/bin/bundle exec /usr/local/bin/rackup -p80 --host 0.0.0.0 -D

EXPOSE 80
