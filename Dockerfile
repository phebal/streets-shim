FROM ruby:2.6.3

EXPOSE 9999
ENV DR_PORT 9999
ENV DR_LOG_DIR /var/log/streets-shim

RUN mkdir -p /var/log/streets-shim

RUN apt-get update
RUN apt-get install -y cmake

WORKDIR /app
COPY . /app

RUN bundle install --without development

CMD ruby /app/app.rb > /var/log/streets-shim/streets-shim.log 2>&1
