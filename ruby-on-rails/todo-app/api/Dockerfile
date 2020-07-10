FROM ruby:2.7-slim AS base
ENV APP_HOME /app
ENV EDITOR vim
ENV HOST 0.0.0.0
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . .
RUN apt-get update -qq
RUN apt-get install -y build-essential vim libpq-dev
RUN gem install bundler:2.1.4
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT bash docker-entrypoint.sh

FROM base AS dev
ENV RAILS_ENV development
ENV PORT 3000
