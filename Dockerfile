# FROM node:alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build
 
# FROM nginx
# COPY --from=builder /app/build /usr/share/nginx/html

#First step
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#Second step
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html