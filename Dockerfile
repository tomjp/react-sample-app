FROM node:lts-alpine as build
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install && npm run build

FROM nginxinc/nginx-unprivileged:alpine
COPY --from=build /usr/src/app/build /usr/share/nginx/html
