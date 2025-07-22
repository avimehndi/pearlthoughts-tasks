FROM node:20

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app (this is the missing part)
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Start in production mode
CMD ["npm", "run", "start"]
