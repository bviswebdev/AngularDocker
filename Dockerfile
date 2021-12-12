FROM node:latest as node
WORKDIR /usr/src/app
RUN git clone https://github.com/bviswebdev/AngularDocker.git
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /usr/src/app/dist/demo-app /usr/share/nginx/html

