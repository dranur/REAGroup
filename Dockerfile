FROM ubuntu:16.04

# Install git and bundler
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y bundler

# Install and start simple sinatra app as daemon listening on port 80
RUN git clone https://github.com/rea-cruitment/simple-sinatra-app.git
RUN cd /simple-sinatra-app && /usr/bin/bundle install
RUN cd /simple-sinatra-app && /usr/bin/bundle exec /usr/local/bin/rackup -p80 --host 0.0.0.0 -D

EXPOSE 80
