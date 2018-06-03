FROM node:carbon
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 8080
