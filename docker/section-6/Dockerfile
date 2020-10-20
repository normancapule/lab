FROM node:12.18.3-alpine as base
ENV APP=/usr/app
WORKDIR $APP
COPY package* .
RUN npm install
COPY . .
CMD ["npm", "run", "start"]

FROM base as builder
WORKDIR /usr/app
RUN npm run build

FROM nginx:1.19.2-alpine as prod
COPY --from=builder /usr/app/build /usr/share/nginx/html

