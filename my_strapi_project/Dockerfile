FROM node:20-alpine

WORKDIR /app

# Optionally, install OS build tools if needed
RUN apk add --no-cache build-base python3

# Copy dependency management files
COPY package.json package-lock.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy the source code
COPY . .

# Build the Strapi Admin panel using npx
RUN npx strapi build

# Expose Strapi port
EXPOSE 1337

# Start Strapi using npx
CMD ["npx", "strapi", "start"]
