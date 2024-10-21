FROM node:22.10-alpine

RUN deluser node \
  && addgroup -S node -g 1000 \
  && adduser -S -G node -u 1000 node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH

# Choose the npm version between 10.8.0 and 10.9.0
RUN npm i --global npm@10.9.0

RUN mkdir app
RUN chown -R node:node app

WORKDIR /app

COPY package.json /app

USER node

RUN npm -ddd install --verbose

RUN cat /home/node/.npm/_logs/*.log
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node"]
