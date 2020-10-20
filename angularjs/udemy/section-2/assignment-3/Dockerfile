FROM node:lts-slim
ENV APP_HOME /app
ENV NG_CLI_ANALYTICS=ci

WORKDIR $APP_HOME
RUN apt-get update -qq && \
    apt-get install -y build-essential apt-transport-https ca-certificates curl
RUN npm install -g npm @angular/cli
RUN ng analytics off
COPY . .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
