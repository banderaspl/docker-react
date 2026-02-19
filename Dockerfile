FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#// path created /app/build <-- all the stuff
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html