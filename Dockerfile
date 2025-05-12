##Stage-1: BUild the code
FROM node:18 AS build

WORKDIR /app

COPY package.json package-lock.json ./

COPY prisma ./prisma

RUN npm install --legacy-peer-deps

COPY . .

RUN npm run build

## Stage-2: Run the app
FROM node:18

WORKDIR /app

COPY --from=build /app ./

EXPOSE 3000

# Set environment variable if needed
ENV NODE_ENV=production

CMD [ "npm", "start" ]