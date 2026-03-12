# Use stable Node version
FROM node:18-alpine

# Install build tools required for sqlite3
RUN apk add --no-cache python3 make g++

# Create app directory
WORKDIR /usr/src/app

# Copy dependency files first (Docker layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application source
COPY . .

# App runs on port 3000
EXPOSE 3000

# Start the application
CMD ["node", "src/index.js"]