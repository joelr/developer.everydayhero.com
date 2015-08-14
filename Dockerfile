FROM ruby:2.1.5

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install
RUN git config --global user.email "deployer@everydayhero.com"
RUN git config --global user.name "Vlad the deployer"

ADD . /usr/src/app

CMD "bin/bash"
