FROM node:22.10

# Choose the npm version between 10.8.0 and 10.9.0
RUN npm i --global npm@10.9.0

WORKDIR /app

RUN chown node:node /app

USER node

RUN npm -ddd install --no-audit --timing always rollup

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node"]
