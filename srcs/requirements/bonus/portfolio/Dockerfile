FROM alpine

RUN apk add --no-cache nodejs npm git

WORKDIR /app

RUN git clone https://github.com/Peu77/Portfolio

WORKDIR /app/Portfolio

RUN npm install

RUN npm run build

CMD ["npm", "start"]

