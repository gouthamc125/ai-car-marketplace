## Stage-1: Application build
FROM node:18

WORKDIR /app

COPY package.json package-lock.json ./
COPY prisma ./prisma

RUN npm install --legacy-peer-deps

COPY . .

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]

