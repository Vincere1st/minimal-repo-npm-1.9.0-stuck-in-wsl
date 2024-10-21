FROM node:22.10

# Choose the npm version between 10.8.0 and 10.9.0
RUN npm i --global npm@10.9.0

WORKDIR /app

COPY package.json /app
RUN chown -R node:node /app

USER node

RUN npm -ddd install --verbose

RUN cat /home/node/.npm/_logs/*.log
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node"]
