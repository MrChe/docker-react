# Build phase
FROM node:alpine

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# Run phase
FROM nginx

EXPOSE 80

# copy from build phase "app/build" to run phase "/usr/share/nginx/html"
COPY --from=0 /app/build /usr/share/nginx/html
