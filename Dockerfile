FROM node:latest as node
WORKDIR /AngularDocker
RUN git clone https://github.com/bviswebdev/AngularDocker.git
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /AngularDocker/dist/angular-docker-app /usr/share/nginx/html

