FROM node AS builder

WORKDIR /react-app

COPY package-lock.json package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:latest

COPY --from=builder  /react-app/dist/ /usr/share/nginx/html


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
