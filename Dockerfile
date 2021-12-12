FROM node:10-alpine as node
WORKDIR /app
RUN git clone https://github.com/bviswebdev/AngularDocker.git /app
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-docker-app /usr/share/nginx/html

