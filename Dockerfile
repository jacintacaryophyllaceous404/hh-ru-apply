FROM node:20-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

RUN npx playwright install --with-deps chromium

ENV DASHBOARD_PORT=3849

EXPOSE 3849

CMD ["node", "scripts/dashboard-server.mjs"]