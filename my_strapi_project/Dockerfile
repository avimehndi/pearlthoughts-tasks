# Stage 1: Build
FROM node:20 AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production
FROM node:20 AS runner
WORKDIR /app

COPY package*.json package-lock.json ./
RUN npm install --omit=dev

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/build ./build
COPY --from=builder /app/public ./public

EXPOSE 1337
CMD ["npm", "start"]
