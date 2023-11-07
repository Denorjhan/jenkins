FROM node:10 AS ui-build

EXPOSE 3000

WORKDIR /node-app

COPY ./app /node-app

RUN cd /node-app && npm install

CMD ["npm", "run", "start"]