FROM alpine

RUN apk add --no-cache nodejs npm git

WORKDIR /app

RUN git clone https://github.com/louislam/uptime-kuma

WORKDIR /app/uptime-kuma

RUN npm install

RUN npm run build

CMD ["npm", "start"]

