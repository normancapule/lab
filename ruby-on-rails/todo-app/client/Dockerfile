FROM node:14-slim AS base
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . .
RUN apt-get update -qq && \
    apt-get install -y build-essential apt-transport-https ca-certificates curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN yarn global add @angular/cli
RUN chmod +x docker-entrypoint.sh

FROM base AS dev
ENTRYPOINT bash docker-entrypoint.sh
