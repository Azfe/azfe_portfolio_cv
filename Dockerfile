# Stage 1: Build — compile SASS to CSS
FROM node:alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Stage 2: Serve — copy compiled assets to Nginx
FROM nginx:alpine

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
COPY --from=builder /app/assets /usr/share/nginx/html/assets
COPY --from=builder /app/src/scripts /usr/share/nginx/html/src/scripts

COPY nginx.conf.template /etc/nginx/templates/default.conf.template

RUN rm /etc/nginx/conf.d/default.conf