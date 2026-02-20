FROM node:20

WORKDIR /app

COPY my-strapi/package*.json ./
RUN npm install

COPY my-strapi/ .

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]

