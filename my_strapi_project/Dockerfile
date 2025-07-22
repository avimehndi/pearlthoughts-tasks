FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose Strapi default port
EXPOSE 1337

# Run Strapi in production mode
ENV HOST=0.0.0.0
ENV NODE_ENV=production
CMD ["npm", "run", "start"]
