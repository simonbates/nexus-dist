FROM node:8-alpine

EXPOSE 9081

WORKDIR /home/node

COPY . /home/node

RUN apk add --no-cache --virtual build-dependencies git && \
    npm install --production && \
    chown -R node:node . && \
    npm cache clean --force && \
    apk del build-dependencies

USER node

CMD ["npm","start"]
