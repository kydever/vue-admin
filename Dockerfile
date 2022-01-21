FROM node:alpine as builder
WORKDIR /usr/src/build
ADD package.json /usr/src/build
ADD yarn.lock /usr/src/build
RUN yarn
COPY . /usr/src/build
WORKDIR /usr/src/build
RUN yarn run build

FROM nginx:alpine

COPY --from=builder /usr/src/build/dist /opt/app
COPY --from=builder /usr/src/build/app.conf /etc/nginx/conf.d/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
