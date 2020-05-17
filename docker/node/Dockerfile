FROM node:12-alpine
RUN apk add --no-cache bash
COPY docker/node/conf_fix.sh /home/node
WORKDIR /app
RUN yarn global add @quasar/cli
COPY ${PROJECT_FOLDER}/${QUASAR_FOLDER} /app
