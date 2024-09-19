FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#Elastic Bean Stock check this expose parameter and map this port automatically
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
