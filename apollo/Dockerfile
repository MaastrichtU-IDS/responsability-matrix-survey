FROM node:16 as base

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

FROM base as dev

ENV DEBUG=*

CMD ["node", "index.js"]

FROM base as prod

CMD ["node", "index.js"]