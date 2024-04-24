FROM node:20 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


FROM nginx:1.25.4-alpine-slim AS runtime

COPY ./.nginx/templates /etc/nginx/templates/

# Add custom scripts to nginx entrypoint. The nginx alpine image uses the busybox sh as the default shell, busybox sh is based on the ash shell, so the script should be compatible with ash
#COPY ./.nginx/customscript.sh /docker-entrypoint.d

COPY --from=builder /app/dist /usr/share/nginx/html

ENV PORT 8080


