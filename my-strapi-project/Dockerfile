# Stage 1: Build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm ci --legacy-peer-deps && npm run build

# Stage 2 : Production stage
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app ./
RUN npm ci --omit=dev --legacy-peer-deps
EXPOSE 1337
CMD ["npm", "start"]